import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';

import '../model/asset/asset_model.dart';

abstract class AssetsService {
  Future<String> createAsset(AssetModel model);
  Future<void> editAsset(AssetModel model);
  Future<void> removeAsset(String assetId);
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
  Stream<List<AssetModel>> showcase(String address);
  Stream<List<({String? link, AssetModel asset})>> purchases(String address);
  Stream<bool> isFavorite(String address, String assetId);
  Future<void> toogleFavorite(String address, String assetId);
  Future<void> changeRating({required AssetModel asset, required double rating});
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
  Future<String> createAsset(AssetModel model) async {
    final assetId = (await store.collection('assets').add(model.toJson())).id;
    await store.collection('assets').doc(assetId).update({'id': assetId});
    return assetId;
  }

  @override
  Future<void> editAsset(AssetModel model) async {
    await store.collection('assets').doc(model.id).update(model.toJson());
  }

  @override
  Future<void> removeAsset(String assetId) async {
    await store.collection('assets').doc(assetId).delete();
  }

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
    const eventName = 'AssetCreated';

    final filter = FilterOptions(
      fromBlock: const BlockNum.genesis(),
      address: contract.address,
      topics: [
        [bytesToHex(contract.event(eventName).signature, padToEvenLength: true, include0x: true)],
        [bytesToHex(EthereumAddress.fromHex(address).addressBytes, forcePadLength: 64, include0x: true)],
      ],
    );

    return web3.events(filter).scan<List<String>>(
      (accumulated, event, index) {
        final results = contract.event(eventName).decodeResults(event.topics!, event.data!);

        if (results.isNotEmpty && results.first is String) {
          final assetId = results.first as String;
          return [...accumulated, assetId];
        }

        return accumulated;
      },
      [],
    ).startWith([]).switchMap((ids) {
      if (ids.isEmpty) {
        return Stream.value([]);
      }
      return store
          .collection('assets')
          .where(FieldPath.documentId, whereIn: ids)
          .snapshots()
          .map((query) => query.docs.map((doc) => AssetModel.fromJson(doc.data())).toList(growable: false));
    });
  }

  @override
  Stream<List<({String? link, AssetModel asset})>> purchases(String address) {
    const eventName = 'AssetSold';

    final filter = FilterOptions(
      fromBlock: const BlockNum.genesis(),
      address: contract.address,
      topics: [
        [bytesToHex(contract.event(eventName).signature, padToEvenLength: true, include0x: true)],
        [],
        [bytesToHex(EthereumAddress.fromHex(address).addressBytes, forcePadLength: 64, include0x: true)],
      ],
    );

    return web3.events(filter).scan<List<({String id, String link})>>(
      (accumulated, event, index) {
        final results = contract.event(eventName).decodeResults(event.topics!, event.data!);

        if (results.isNotEmpty && results.first is String && results[3] is String) {
          final assetId = results.first as String;
          return [...accumulated, (id: assetId, link: results[3])];
        }

        return accumulated;
      },
      [],
    ).startWith([]).switchMap((results) {
      if (results.isEmpty) {
        return Stream.value([]);
      }

      return store
          .collection('assets')
          .where(FieldPath.documentId, whereIn: results.map((result) => result.id))
          .snapshots()
          .map(
            (query) => query.docs.map(
              (doc) {
                final linkIndex = results.indexWhere((element) => element.id == doc.id);
                return (link: linkIndex != -1 ? results[linkIndex].link : null, asset: AssetModel.fromJson(doc.data()));
              },
            ).toList(growable: false),
          );
    });
  }

  @override
  Future<void> changeRating({required AssetModel asset, required double rating}) async {
    await store.collection('assets').doc(asset.id).update(asset.copyWith(rating: rating).toJson());
  }
}
