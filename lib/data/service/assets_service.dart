import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';

import '../model/asset/asset_model.dart';
import '../model/contract_asset/contract_asset.dart';

abstract class AssetsService {
  Future<List<AssetModel>> getFavoriteAssets({
    required String address,
    required String? lastAssetId,
    required int limit,
  });

  Future<List<AssetModel>> getCategoryAssets(
    String category, {
    required String? lastAssetId,
    required int limit,
    bool force = false,
  });

  Stream<List<AssetModel>> showcase(String address);
}

@LazySingleton(as: AssetsService)
class AssetsServiceImpl extends AssetsService {
  final FirebaseFirestore store;
  final Web3Client web3;
  final DeployedContract contract;

  AssetsServiceImpl({
    required this.store,
    required this.web3,
    required this.contract,
  });

  @override
  Future<List<AssetModel>> getFavoriteAssets({
    required String address,
    required String? lastAssetId,
    required int limit,
  }) async {
    var idsQuery =
        store.collection('favorite_assets').doc(address).collection('ids').orderBy(FieldPath.documentId).limit(limit);

    if (lastAssetId != null) {
      idsQuery = idsQuery.startAfter([lastAssetId]);
    }

    final ids = (await idsQuery.get()).docs.map((doc) => doc.id).toList();

    if (ids.isEmpty) {
      return [];
    }

    final modelsQuery = store.collection('assets').where(FieldPath.documentId, whereIn: ids);
    final models = (await modelsQuery.get()).docs.map((doc) => AssetModel.fromJson(doc.data())).toList();

    return models;
  }

  @override
  Future<List<AssetModel>> getCategoryAssets(
    String category, {
    required String? lastAssetId,
    required int limit,
    bool force = false,
  }) async {
    final query = store
        .collection('assets')
        .where('category', isEqualTo: category)
        .orderBy('id')
        .startAfter([lastAssetId]).limit(limit);

    final models = (await query.get()).docs.map((doc) => AssetModel.fromJson(doc.data())).toList();
    return models;
  }

  @override
  Stream<List<AssetModel>> showcase(String address) {
    final filter = FilterOptions(
      fromBlock: const BlockNum.genesis(),
      address: contract.address,
      topics: [
        [bytesToHex(contract.event('AssetCreated').signature, padToEvenLength: true, include0x: true)],
        [bytesToHex(EthereumAddress.fromHex(address).addressBytes, forcePadLength: 64, include0x: true)],
      ],
    );

    return web3.events(filter).scan<List<String>>(
      (accumulated, event, index) {
        final results = contract.event('AssetCreated').decodeResults(event.topics!, event.data!);

        if (results.isNotEmpty && results.first is String) {
          final assetId = results.first as String;
          return [...accumulated, assetId];
        }

        return accumulated;
      },
      [],
    ).startWith([]).asyncMap((ids) async {
      if (ids.isEmpty) {
        return [];
      }

      try {
        final modelsQuery = store.collection('assets').where(FieldPath.documentId, whereIn: ids);
        return (await modelsQuery.get()).docs.map((doc) => AssetModel.fromJson(doc.data())).toList();
      } catch (_) {
        return [];
      }
    });
  }
}
