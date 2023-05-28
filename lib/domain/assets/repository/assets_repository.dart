import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entity/asset_entity.dart';

abstract class AssetsRepository {
  Future<Either<Failure, void>> createAsset({
    File? coverFile,
    required List<({File? file, String? url})> images,
    required String link,
    required AssetEntity modifiedAsset,
  });
  Future<Either<Failure, void>> editAsset({
    File? coverFile,
    required List<({File? file, String? url})> images,
    required AssetEntity modifiedAsset,
  });

  Stream<AssetEntity?> asset(String assetId);
  Stream<Either<Failure, List<AssetEntity>>> getCategoryAssets(
    String? category, {
    required Stream<String?> lastAssetIdStream,
    required int limit,
    bool force = false,
  });
  Stream<bool> isFavorite(String assetId);
  Future<Either<Failure, void>> toggleFavorite(String assetId);
  Future<Either<Failure, void>> changeRating({required AssetEntity asset, required double rating});
}
