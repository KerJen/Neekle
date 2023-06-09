part of 'cubit.dart';

@freezed
class AssetsListState with _$AssetsListState {
  const factory AssetsListState.loading() = _AssetsListLoadingState;
  const factory AssetsListState.assets({required List<({bool inShopcart, AssetEntity asset})> assets}) =
      _AssetsListState;
  const factory AssetsListState.failure({required String message}) = _AssetsListFailureState;
}
