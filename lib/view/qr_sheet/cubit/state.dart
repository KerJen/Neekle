part of 'cubit.dart';

@freezed
class QrState with _$QrState {
  const factory QrState.loading() = _QrLoadingState;

  const factory QrState.qr({required String data}) = _QrState;

  const factory QrState.auth() = _QrAuthState;

  const factory QrState.failure({required String message}) = _QrFailureState;
}
