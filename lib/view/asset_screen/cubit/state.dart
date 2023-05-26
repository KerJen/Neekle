part of 'cubit.dart';

@freezed
class AssetState with _$AssetState {
  const factory AssetState.loading() = _AssetLoadingState;

  const factory AssetState.asset({required ({bool inShopcart, bool isFavorite, AssetEntity asset}) asset}) = _AssetState;

  const factory AssetState.failure() = _AssetFailureState;
}
