import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:web3dart/web3dart.dart';

import '../../core/const.dart';
import '../../core/di/di.dart';
import '../../domain/assets/entity/asset_entity.dart';
import '../../core/error/failure.dart';
import '../../domain/assets/repository/assets_repository.dart';
import '../converter/asset_entity_converter.dart';
import '../converter/asset_model_converter.dart';
import '../service/assets_service.dart';
import '../service/auth_service.dart';
import '../service/file_service.dart';

@LazySingleton(as: AssetsRepository)
class AssetsRepositoryImpl extends AssetsRepository {
  final AuthService authService;
  final AssetsService assetsService;
  final FilesService filesService;

  final DeployedContract contract;

  final AssetModelConverter assetModelConverter;
  final AssetEntityConverter assetEntityConverter;

  AssetsRepositoryImpl({
    required this.authService,
    required this.assetsService,
    required this.filesService,
    required this.contract,
    required this.assetModelConverter,
    required this.assetEntityConverter,
  });

  @override
  Future<Either<Failure, void>> createAsset({
    File? coverFile,
    required List<({File? file, String? url})> images,
    required String link,
    required AssetEntity modifiedAsset,
  }) async {
    try {
      final newAsset = await _prepareAsset(
        coverFile: coverFile,
        images: images,
        modifiedAsset: modifiedAsset,
      );
      final assetId = await assetsService.createAsset(assetModelConverter.convert(newAsset));

      try {
        await authService.sendTransaction(
          Transaction.callContract(
            contract: contract,
            function: contract.function('createAsset'),
            parameters: [assetId, link, BigInt.from(modifiedAsset.price * weiInEth)],
          ),
        );
      } catch (_) {
        await assetsService.removeAsset(assetId);
        return Left(UnknownFailure());
      }

      return const Right(null);
    } catch (_) {
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, void>> editAsset({
    File? coverFile,
    required List<({File? file, String? url})> images,
    required AssetEntity modifiedAsset,
  }) async {
    try {
      final newAsset = await _prepareAsset(
        coverFile: coverFile,
        images: images,
        modifiedAsset: modifiedAsset,
      );

      await assetsService.editAsset(assetModelConverter.convert(newAsset));
      return const Right(null);
    } catch (_) {
      return Left(UnknownFailure());
    }
  }

  Future<AssetEntity> _prepareAsset({
    File? coverFile,
    required List<({File? file, String? url})> images,
    required AssetEntity modifiedAsset,
  }) async {
    AssetEntity newAsset = modifiedAsset.copyWith();
    if (coverFile != null) {
      newAsset = newAsset.copyWith(coverUrl: await filesService.uploadFile(coverFile));
    }

    final newImageUrls = <String>[];
    for (int i = 0; i < images.length; i++) {
      final image = images[i];

      if (image.file != null) {
        newImageUrls.add(await filesService.uploadFile(image.file!));
      } else if (image.url != null) {
        newImageUrls.add(image.url!);
      }
    }

    return newAsset.copyWith(imageUrls: newImageUrls);
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

  @override
  Future<Either<Failure, void>> changeRating({required AssetEntity asset, required double rating}) async {
    try {
      await assetsService.changeRating(asset: assetModelConverter.convert(asset), rating: rating);
      return const Right(null);
    } catch (_) {
      return Left(UnknownFailure());
    }
  }
}
