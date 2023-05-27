part of 'cubit.dart';

@freezed
class SetAssetState with _$SetAssetState {
  const factory SetAssetState.initial() = _SetAssetInitialState;

  const factory SetAssetState.loading() = _SetAssetLoadingState;

  const factory SetAssetState.set() = _SetAssetState;

  const factory SetAssetState.failure() = _SetAssetFailureState;
}
