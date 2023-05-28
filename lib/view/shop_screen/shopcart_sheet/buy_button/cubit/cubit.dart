import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../domain/profile/repository/profile_repository.dart';
import '../../../../../domain/assets/entity/asset_entity.dart';
import '../../../../../domain/shop/repository/shop_repository.dart';

part 'cubit.freezed.dart';
part 'state.dart';

@injectable
class ShopcartBuyButtonCubit extends Cubit<ShopcartBuyButtonState> {
  final ProfileRepository profileRepository;
  final ShopRepository shopRepository;

  StreamSubscription? _subscription;

  ShopcartBuyButtonCubit({
    required this.profileRepository,
    required this.shopRepository,
  }) : super(const ShopcartBuyButtonState.loading()) {
    _subscription = profileRepository
        .currentProfile()
        .map((event) => ShopcartBuyButtonState.auth(isAuthorized: event != null))
        .listen(emit);
  }

  void buyAssets() async {
    final prevState = state;

    emit(const ShopcartBuyButtonState.loading());
    final buyEither = await shopRepository.buyAssets();

    buyEither.fold(
      (failure) async {
        emit(const ShopcartBuyButtonState.failure());
        await Future.delayed(const Duration(seconds: 2), () {});
        emit(prevState);
      },
      (_) async {
        await shopRepository.clearShopcart();
        emit(const ShopcartBuyButtonState.bought());
      },
    );
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
