part of 'cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.loading() = _ProfileLoadingState;

  const factory ProfileState.qr({required String data}) = _ProfileQrState;

  const factory ProfileState.profile({required ProfileEntity? profile}) = _ProfileState;

  const factory ProfileState.failure({required String message}) = _ProfileFailureState;
}
