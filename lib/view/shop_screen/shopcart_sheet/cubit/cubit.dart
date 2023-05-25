import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

import '../../../../domain/assets/entity/asset_entity.dart';
import '../../../../domain/shop/repository/shop_repository.dart';

part 'cubit.freezed.dart';
part 'state.dart';

@injectable
class ShopcartCubit extends Cubit<ShopcartState> {
  final ShopRepository shopRepository;

  StreamSubscription? _shopcartSubcription;

  ShopcartCubit({
    required this.shopRepository,
  }) : super(const ShopcartState.loading()) {
    _shopcartSubcription =
        shopRepository.getShopcart().map((assets) => ShopcartState.cart(assets: assets)).listen(emit);
  }

  void removeFromShopcart(String assetId) async {
    await shopRepository.removeAssetFromShopcart(assetId);
  }

  @override
  Future<void> close() async {
    await _shopcartSubcription?.cancel();
    return super.close();
  }
}
