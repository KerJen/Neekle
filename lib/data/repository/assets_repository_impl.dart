import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/assets/entity/asset_entity.dart';
import '../../core/error/failure.dart';
import '../../domain/assets/repository/assets_repository.dart';
import '../converter/asset_entity_converter.dart';
import '../service/assets_service.dart';

@LazySingleton(as: AssetsRepository)
class AssetsRepositoryImpl extends AssetsRepository {
  final AssetsService assetsService;

  final AssetEntityConverter assetEntityConverter;

  AssetsRepositoryImpl({
    required this.assetsService,
    required this.assetEntityConverter,
  });

  @override
  Future<Either<Failure, List<AssetEntity>>> getAssets(
    String category, {
    required String? lastAssetId,
    required int limit,
    bool force = false,
  }) async {
    try {
      final models = await assetsService.getAssets(category, lastAssetId: lastAssetId, limit: limit);
      return Right(models.map((model) => assetEntityConverter.convert(model)).toList(growable: false));
    } catch (_) {
      return Left(UnknownFailure());
    }
  }
}
