import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';

import '../model/asset/asset_model.dart';

abstract class AssetsService {
  Stream<AssetModel?> asset(String assetId);

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

  Stream<bool> isFavorite(String address, String assetId);

  Future<void> toogleFavorite(String address, String assetId);

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
  Stream<AssetModel?> asset(String assetId) {
    return store
        .collection('assets')
        .doc(assetId)
        .snapshots()
        .map((doc) => doc.data() != null ? AssetModel.fromJson(doc.data()!) : null);
  }

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
  Stream<bool> isFavorite(String address, String assetId) {
    return store
        .collection('favorite_assets')
        .doc(address)
        .collection('ids')
        .doc(assetId)
        .snapshots()
        .map((event) => event.data() != null);
  }

  @override
  Future<void> toogleFavorite(String address, String assetId) async {
    final collection = store.collection('favorite_assets').doc(address).collection('ids');
    final doc = collection.doc(assetId);
    if ((await doc.get()).exists) {
      await doc.delete();
    } else {
      doc.set({});
    }
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
