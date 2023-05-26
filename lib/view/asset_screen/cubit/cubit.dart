import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../../domain/assets/entity/asset_entity.dart';
import '../../../domain/assets/repository/assets_repository.dart';
import '../../../domain/shop/repository/shop_repository.dart';

part 'cubit.freezed.dart';
part 'state.dart';

@injectable
class AssetCubit extends Cubit<AssetState> {
  final String assetId;
  final AssetsRepository assetsRepository;
  final ShopRepository shopRepository;

  StreamSubscription? _assetSubscription;

  AssetCubit({
    @factoryParam required this.assetId,
    required this.assetsRepository,
    required this.shopRepository,
  }) : super(const AssetState.loading()) {
    _assetSubscription = Rx.combineLatest3(
        assetsRepository.asset(assetId), shopRepository.shopcartAsset(assetId), assetsRepository.isFavorite(assetId),
        (asset, shopcartAsset, isFavorite) {
      if (asset == null) {
        return const AssetState.failure();
      }

      return AssetState.asset(asset: (inShopcart: shopcartAsset != null, isFavorite: isFavorite, asset: asset));
    }).listen(emit);
  }

  void toggleFavorite() async {
    assetsRepository.toggleFavorite(assetId);
  }

  void addToShopcart(AssetEntity asset) async {
    await shopRepository.addAssetToShopcart(asset);
  }

  void removeFromShopcart(String assetId) async {
    await shopRepository.removeAssetFromShopcart(assetId);
  }

  @override
  Future<void> close() async {
    await _assetSubscription?.cancel();
    return super.close();
  }
}
