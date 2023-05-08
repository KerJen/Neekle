import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import '../model/asset/asset_model.dart';

abstract class AssetsService {
  Future<List<AssetModel>> getAssets(
    String category, {
    required String? lastAssetId,
    required int limit,
    bool force = false,
  });
}

@Injectable(as: AssetsService)
class AssetsServiceImpl extends AssetsService {
  final FirebaseFirestore store;

  AssetsServiceImpl({required this.store});

  @override
  Future<List<AssetModel>> getAssets(
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

    final snapshot = await query.get();
    return snapshot.docs.map((doc) => AssetModel.fromJson(doc.data())).toList();
  }
}
