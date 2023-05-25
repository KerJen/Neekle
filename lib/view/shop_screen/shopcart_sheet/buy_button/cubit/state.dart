part of 'cubit.dart';

@freezed
class ShopcartBuyButtonState with _$ShopcartBuyButtonState {
  const factory ShopcartBuyButtonState.loading() = _ShopcartBuyButtonLoadingState;
  const factory ShopcartBuyButtonState.auth({required bool isAuthorized}) = _ShopcartBuyButtonAuthState;
  const factory ShopcartBuyButtonState.bought() = _ShopcartBuyButtonBoughtState;
  const factory ShopcartBuyButtonState.failure() = _ShopcartBuyButtonFailureState;
}
