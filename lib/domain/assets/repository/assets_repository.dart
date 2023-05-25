import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entity/asset_entity.dart';

abstract class AssetsRepository {
  Stream<Either<Failure, List<AssetEntity>>> getCategoryAssets(
    String? category, {
    required Stream<String?> lastAssetIdStream,
    required int limit,
    bool force = false,
  });
}
