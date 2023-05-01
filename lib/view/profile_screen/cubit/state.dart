part of 'cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.loading() = _ProfileLoadingState;

  const factory ProfileState.profile() = _ProfileState;
}
