import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../domain/assets/entity/asset_entity.dart';
import '../../../../domain/assets/repository/assets_repository.dart';
import '../../../../domain/shop/repository/shop_repository.dart';

part 'cubit.freezed.dart';
part 'state.dart';

@injectable
class AssetsListCubit extends Cubit<AssetsListState> {
  final AssetsRepository assetsRepository;
  final ShopRepository shopRepository;

  StreamSubscription? _assetsSubscription;

  final _lastAssetIdController = StreamController<String?>.broadcast();

  AssetsListCubit({
    @factoryParam String? category,
    required this.assetsRepository,
    required this.shopRepository,
  }) : super(const AssetsListState.loading()) {
    _assetsSubscription = Rx.combineLatest2(
      assetsRepository.getCategoryAssets(category, lastAssetIdStream: _lastAssetIdController.stream, limit: 10),
      shopRepository.getShopcart(),
      (assets, shopcart) {
        emit(const AssetsListState.loading());

        return assets.fold(
          (failure) => const AssetsListState.failure(message: 'Unknown error'),
          (assets) {
            final List<({bool inShopcart, AssetEntity asset})> formatAssets = [];

            for (final asset in assets) {
              formatAssets.add((inShopcart: shopcart.contains(asset), asset: asset));
            }

            return AssetsListState.assets(assets: formatAssets);
          },
        );
      },
    ).listen(emit);
  }

  void loadMore(String? lastAssetId) async {
    _lastAssetIdController.add(lastAssetId);
  }

  void addToShopcart(AssetEntity asset) async {
    await shopRepository.addAssetToShopcart(asset);
  }

  void removeFromShopcart(String assetId) async {
    await shopRepository.removeAssetFromShopcart(assetId);
  }

  @override
  Future<void> close() async {
    await _assetsSubscription?.cancel();
    return super.close();
  }
}
