part of 'cubit.dart';

@freezed
class StudioState with _$StudioState {
  const factory StudioState.loading() = _StudioLoadingState;

  const factory StudioState.needLogIn() = _StudioNeedLogInState;

  const factory StudioState.studio({
    required List<AssetEntity> showcase,
  }) = _StudioState;
}
