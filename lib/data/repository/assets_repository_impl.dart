import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/assets/entity/asset_entity.dart';
import '../../core/error/failure.dart';
import '../../domain/assets/repository/assets_repository.dart';
import '../converter/asset_entity_converter.dart';
import '../service/assets_service.dart';
import '../service/auth_service.dart';

@LazySingleton(as: AssetsRepository)
class AssetsRepositoryImpl extends AssetsRepository {
  final AuthService authService;
  final AssetsService assetsService;

  final AssetEntityConverter assetEntityConverter;

  AssetsRepositoryImpl({
    required this.authService,
    required this.assetsService,
    required this.assetEntityConverter,
  });

  @override
  Future<Either<Failure, List<AssetEntity>>> getFavoriteAssets({
    required String? lastAssetId,
    required int limit,
  }) async {
    try {
      final address = (await authService.authStateChanges().first)?.uid;

      if (address == null) {
        return Left(UnauthorizedFailure());
      }

      final models = await assetsService.getFavoriteAssets(address: address, lastAssetId: lastAssetId, limit: limit);
      return Right(models.map((model) => assetEntityConverter.convert(model)).toList(growable: false));
    } catch (_) {
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, List<AssetEntity>>> getCategoryAssets(
    String category, {
    required String? lastAssetId,
    required int limit,
    bool force = false,
  }) async {
    try {
      final models = await assetsService.getCategoryAssets(category, lastAssetId: lastAssetId, limit: limit);
      return Right(models.map((model) => assetEntityConverter.convert(model)).toList(growable: false));
    } catch (_) {
      return Left(UnknownFailure());
    }
  }
}