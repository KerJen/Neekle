import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

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

  @override
  Future<void> close() async {
    await _shopcartSubcription?.cancel();
    return super.close();
  }
}
