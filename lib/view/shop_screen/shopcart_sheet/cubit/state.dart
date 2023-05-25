part of 'cubit.dart';

@freezed
class ShopcartState with _$ShopcartState {
  const factory ShopcartState.loading() = _ShopcartLoadingState;

  const factory ShopcartState.cart({required List<AssetEntity> assets}) = _ShopcartState;

  const factory ShopcartState.bought() = _ShopcartBoughtState;
}
