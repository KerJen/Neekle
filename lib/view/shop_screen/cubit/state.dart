part of 'cubit.dart';

@freezed
class ShopState with _$ShopState {
  const factory ShopState.loading() = _ShopLoadingState;

  const factory ShopState.shop({required bool isAuthorized}) = _ShopState;
}
