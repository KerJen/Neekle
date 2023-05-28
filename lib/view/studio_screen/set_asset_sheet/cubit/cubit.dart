import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../domain/assets/entity/asset_entity.dart';
import '../../../../domain/assets/repository/assets_repository.dart';

part 'cubit.freezed.dart';
part 'state.dart';

@injectable
class SetAssetCubit extends Cubit<SetAssetState> {
  final AssetsRepository assetsRepository;

  SetAssetCubit({
    required this.assetsRepository,
  }) : super(const SetAssetState.initial());

  void createAsset({
    File? coverFile,
    required List<({File? file, String? url})> images,
    required String link,
    required AssetEntity modifiedAsset,
  }) async {
    emit(const SetAssetState.loading());

    final setEither = await assetsRepository.createAsset(
      coverFile: coverFile,
      images: images,
      link: link,
      modifiedAsset: modifiedAsset,
    );

    _emitSuccess(setEither);
  }

  void editAsset({
    File? coverFile,
    required List<({File? file, String? url})> images,
    required AssetEntity modifiedAsset,
  }) async {
    emit(const SetAssetState.loading());
    final setEither =
        await assetsRepository.editAsset(coverFile: coverFile, images: images, modifiedAsset: modifiedAsset);

    _emitSuccess(setEither);
  }

  void _emitSuccess(Either<Failure, void> setEither) {
    setEither.fold(
      (failure) async {
        emit(const SetAssetState.failure());
        await Future.delayed(const Duration(seconds: 2));
        emit(const SetAssetState.initial());
      },
      (_) => emit(
        const SetAssetState.set(),
      ),
    );
  }
}
