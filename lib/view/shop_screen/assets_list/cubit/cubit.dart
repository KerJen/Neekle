import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/assets/entity/asset_entity.dart';
import '../../../../domain/assets/repository/assets_repository.dart';

part 'cubit.freezed.dart';
part 'state.dart';

@injectable
class AssetsListCubit extends Cubit<AssetsListState> {
  final AssetsRepository assetsRepository;

  AssetsListCubit({
    required this.assetsRepository,
  }) : super(const AssetsListState.loading());

  Future<void> getAssets(
    String category,
    String? lastAssetId,
  ) async {
    emit(const AssetsListState.loading());

    final result = await assetsRepository.getAssets(category, lastAssetId: lastAssetId, limit: 10);

    result.fold(
      (failure) => emit(const AssetsListState.failure(message: 'Unknown error')),
      (assets) => emit(AssetsListState.assets(assets: assets)),
    );
  }
}
