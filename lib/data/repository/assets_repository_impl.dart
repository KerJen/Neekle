import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../domain/assets/entity/asset_entity.dart';
import '../../core/error/failure.dart';
import '../../domain/assets/repository/assets_repository.dart';
import '../converter/asset_entity_converter.dart';
import '../converter/asset_model_converter.dart';
import '../service/assets_service.dart';
import '../service/auth_service.dart';

@LazySingleton(as: AssetsRepository)
class AssetsRepositoryImpl extends AssetsRepository {
  final AuthService authService;
  final AssetsService assetsService;

  final AssetModelConverter assetModelConverter;
  final AssetEntityConverter assetEntityConverter;

  AssetsRepositoryImpl({
    required this.authService,
    required this.assetsService,
    required this.assetModelConverter,
    required this.assetEntityConverter,
  });

  @override
  Future<Either<Failure, void>> createAsset(AssetEntity asset) async {
    try {
      await assetsService.createAsset(assetModelConverter.convert(asset));
      return const Right(null);
    } catch (_) {
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, void>> editAsset(AssetEntity asset) async {
    try {
      await assetsService.editAsset(assetModelConverter.convert(asset));
      return const Right(null);
    } catch (_) {
      return Left(UnknownFailure());
    }
  }

  @override
  Stream<AssetEntity?> asset(String assetId) {
    return assetsService.asset(assetId).map((model) => model != null ? assetEntityConverter.convert(model) : null);
  }

  @override
  Stream<Either<Failure, List<AssetEntity>>> getCategoryAssets(
    String? category, {
    required Stream<String?> lastAssetIdStream,
    required int limit,
    bool force = false,
  }) {
    return lastAssetIdStream.asyncMap((lastAssetId) async {
      try {
        if (category != null) {
          final models = await assetsService.getCategoryAssets(category, lastAssetId: lastAssetId, limit: limit);
          return Right(models.map((model) => assetEntityConverter.convert(model)).toList(growable: false));
        } else {
          final address = (await authService.authStateChanges().first)?.uid;

          if (address == null) {
            return Left(UnauthorizedFailure());
          }

          final models =
              await assetsService.getFavoriteAssets(address: address, lastAssetId: lastAssetId, limit: limit);
          return Right(models.map((model) => assetEntityConverter.convert(model)).toList(growable: false));
        }
      } catch (_) {
        return Left(UnknownFailure());
      }
    });
  }

  @override
  Stream<bool> isFavorite(String assetId) {
    return authService.authStateChanges().switchMap((user) {
      if (user == null) {
        return Stream.value(false);
      }
      return assetsService.isFavorite(user.uid, assetId);
    });
  }

  @override
  Future<Either<Failure, void>> toggleFavorite(String assetId) async {
    try {
      final address = (await authService.authStateChanges().first)?.uid;

      if (address == null) {
        return Left(UnauthorizedFailure());
      }

      await assetsService.toogleFavorite(address, assetId);
      return const Right(null);
    } catch (_) {
      return Left(UnknownFailure());
    }
  }
}
