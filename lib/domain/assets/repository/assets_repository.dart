import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entity/asset_entity.dart';

abstract class AssetsRepository {
  Future<Either<Failure, List<AssetEntity>>> getFavoriteAssets({
    required String? lastAssetId,
    required int limit,
  });

  Future<Either<Failure, List<AssetEntity>>> getCategoryAssets(
    String category, {
    required String? lastAssetId,
    required int limit,
    bool force = false,
  });
}
