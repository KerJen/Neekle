part of 'cubit.dart';

@freezed
class PurchasedAssetsState with _$PurchasedAssetsState {
  const factory PurchasedAssetsState.loading() = _PurchasedAssetsLoadingState;

  const factory PurchasedAssetsState.assets({required List<({String? link, AssetEntity asset})> assets}) =
      _PurchasedAssetsState;

  const factory PurchasedAssetsState.failure() = _PurchasedAssetsFailureState;
}
