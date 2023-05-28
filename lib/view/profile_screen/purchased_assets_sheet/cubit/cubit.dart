import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/assets/entity/asset_entity.dart';
import '../../../../domain/assets/repository/assets_repository.dart';
import '../../../../domain/profile/repository/profile_repository.dart';

part 'cubit.freezed.dart';
part 'state.dart';

@injectable
class PurchasedAssetsCubit extends Cubit<PurchasedAssetsState> {
  final ProfileRepository profileRepository;
  final AssetsRepository assetsRepository;

  StreamSubscription? _assetsSubscription;

  PurchasedAssetsCubit({
    required this.profileRepository,
    required this.assetsRepository,
  }) : super(const PurchasedAssetsState.loading()) {
    _assetsSubscription = profileRepository.currentProfile().map((profile) {
      if (profile == null) {
        return const PurchasedAssetsState.failure();
      }

      return PurchasedAssetsState.assets(assets: profile.purchases);
    }).listen(emit);
  }

  void changeRating({required AssetEntity asset, required double rating}) async {
    await assetsRepository.changeRating(asset: asset, rating: rating);
  }

  @override
  Future<void> close() async {
    await _assetsSubscription?.cancel();
    return super.close();
  }
}
