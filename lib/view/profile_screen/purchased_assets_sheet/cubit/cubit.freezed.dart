// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PurchasedAssetsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<({AssetEntity asset, String? link})> assets)
        assets,
    required TResult Function() failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<({AssetEntity asset, String? link})> assets)? assets,
    TResult? Function()? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<({AssetEntity asset, String? link})> assets)? assets,
    TResult Function()? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PurchasedAssetsLoadingState value) loading,
    required TResult Function(_PurchasedAssetsState value) assets,
    required TResult Function(_PurchasedAssetsFailureState value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PurchasedAssetsLoadingState value)? loading,
    TResult? Function(_PurchasedAssetsState value)? assets,
    TResult? Function(_PurchasedAssetsFailureState value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PurchasedAssetsLoadingState value)? loading,
    TResult Function(_PurchasedAssetsState value)? assets,
    TResult Function(_PurchasedAssetsFailureState value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchasedAssetsStateCopyWith<$Res> {
  factory $PurchasedAssetsStateCopyWith(PurchasedAssetsState value,
          $Res Function(PurchasedAssetsState) then) =
      _$PurchasedAssetsStateCopyWithImpl<$Res, PurchasedAssetsState>;
}

/// @nodoc
class _$PurchasedAssetsStateCopyWithImpl<$Res,
        $Val extends PurchasedAssetsState>
    implements $PurchasedAssetsStateCopyWith<$Res> {
  _$PurchasedAssetsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_PurchasedAssetsLoadingStateCopyWith<$Res> {
  factory _$$_PurchasedAssetsLoadingStateCopyWith(
          _$_PurchasedAssetsLoadingState value,
          $Res Function(_$_PurchasedAssetsLoadingState) then) =
      __$$_PurchasedAssetsLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_PurchasedAssetsLoadingStateCopyWithImpl<$Res>
    extends _$PurchasedAssetsStateCopyWithImpl<$Res,
        _$_PurchasedAssetsLoadingState>
    implements _$$_PurchasedAssetsLoadingStateCopyWith<$Res> {
  __$$_PurchasedAssetsLoadingStateCopyWithImpl(
      _$_PurchasedAssetsLoadingState _value,
      $Res Function(_$_PurchasedAssetsLoadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_PurchasedAssetsLoadingState implements _PurchasedAssetsLoadingState {
  const _$_PurchasedAssetsLoadingState();

  @override
  String toString() {
    return 'PurchasedAssetsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PurchasedAssetsLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<({AssetEntity asset, String? link})> assets)
        assets,
    required TResult Function() failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<({AssetEntity asset, String? link})> assets)? assets,
    TResult? Function()? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<({AssetEntity asset, String? link})> assets)? assets,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PurchasedAssetsLoadingState value) loading,
    required TResult Function(_PurchasedAssetsState value) assets,
    required TResult Function(_PurchasedAssetsFailureState value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PurchasedAssetsLoadingState value)? loading,
    TResult? Function(_PurchasedAssetsState value)? assets,
    TResult? Function(_PurchasedAssetsFailureState value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PurchasedAssetsLoadingState value)? loading,
    TResult Function(_PurchasedAssetsState value)? assets,
    TResult Function(_PurchasedAssetsFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _PurchasedAssetsLoadingState implements PurchasedAssetsState {
  const factory _PurchasedAssetsLoadingState() = _$_PurchasedAssetsLoadingState;
}

/// @nodoc
abstract class _$$_PurchasedAssetsStateCopyWith<$Res> {
  factory _$$_PurchasedAssetsStateCopyWith(_$_PurchasedAssetsState value,
          $Res Function(_$_PurchasedAssetsState) then) =
      __$$_PurchasedAssetsStateCopyWithImpl<$Res>;
  @useResult
  $Res call({List<({AssetEntity asset, String? link})> assets});
}

/// @nodoc
class __$$_PurchasedAssetsStateCopyWithImpl<$Res>
    extends _$PurchasedAssetsStateCopyWithImpl<$Res, _$_PurchasedAssetsState>
    implements _$$_PurchasedAssetsStateCopyWith<$Res> {
  __$$_PurchasedAssetsStateCopyWithImpl(_$_PurchasedAssetsState _value,
      $Res Function(_$_PurchasedAssetsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assets = null,
  }) {
    return _then(_$_PurchasedAssetsState(
      assets: null == assets
          ? _value._assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<({AssetEntity asset, String? link})>,
    ));
  }
}

/// @nodoc

class _$_PurchasedAssetsState implements _PurchasedAssetsState {
  const _$_PurchasedAssetsState(
      {required final List<({AssetEntity asset, String? link})> assets})
      : _assets = assets;

  final List<({AssetEntity asset, String? link})> _assets;
  @override
  List<({AssetEntity asset, String? link})> get assets {
    if (_assets is EqualUnmodifiableListView) return _assets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assets);
  }

  @override
  String toString() {
    return 'PurchasedAssetsState.assets(assets: $assets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PurchasedAssetsState &&
            const DeepCollectionEquality().equals(other._assets, _assets));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_assets));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PurchasedAssetsStateCopyWith<_$_PurchasedAssetsState> get copyWith =>
      __$$_PurchasedAssetsStateCopyWithImpl<_$_PurchasedAssetsState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<({AssetEntity asset, String? link})> assets)
        assets,
    required TResult Function() failure,
  }) {
    return assets(this.assets);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<({AssetEntity asset, String? link})> assets)? assets,
    TResult? Function()? failure,
  }) {
    return assets?.call(this.assets);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<({AssetEntity asset, String? link})> assets)? assets,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    if (assets != null) {
      return assets(this.assets);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PurchasedAssetsLoadingState value) loading,
    required TResult Function(_PurchasedAssetsState value) assets,
    required TResult Function(_PurchasedAssetsFailureState value) failure,
  }) {
    return assets(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PurchasedAssetsLoadingState value)? loading,
    TResult? Function(_PurchasedAssetsState value)? assets,
    TResult? Function(_PurchasedAssetsFailureState value)? failure,
  }) {
    return assets?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PurchasedAssetsLoadingState value)? loading,
    TResult Function(_PurchasedAssetsState value)? assets,
    TResult Function(_PurchasedAssetsFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (assets != null) {
      return assets(this);
    }
    return orElse();
  }
}

abstract class _PurchasedAssetsState implements PurchasedAssetsState {
  const factory _PurchasedAssetsState(
          {required final List<({AssetEntity asset, String? link})> assets}) =
      _$_PurchasedAssetsState;

  List<({AssetEntity asset, String? link})> get assets;
  @JsonKey(ignore: true)
  _$$_PurchasedAssetsStateCopyWith<_$_PurchasedAssetsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PurchasedAssetsFailureStateCopyWith<$Res> {
  factory _$$_PurchasedAssetsFailureStateCopyWith(
          _$_PurchasedAssetsFailureState value,
          $Res Function(_$_PurchasedAssetsFailureState) then) =
      __$$_PurchasedAssetsFailureStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_PurchasedAssetsFailureStateCopyWithImpl<$Res>
    extends _$PurchasedAssetsStateCopyWithImpl<$Res,
        _$_PurchasedAssetsFailureState>
    implements _$$_PurchasedAssetsFailureStateCopyWith<$Res> {
  __$$_PurchasedAssetsFailureStateCopyWithImpl(
      _$_PurchasedAssetsFailureState _value,
      $Res Function(_$_PurchasedAssetsFailureState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_PurchasedAssetsFailureState implements _PurchasedAssetsFailureState {
  const _$_PurchasedAssetsFailureState();

  @override
  String toString() {
    return 'PurchasedAssetsState.failure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PurchasedAssetsFailureState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<({AssetEntity asset, String? link})> assets)
        assets,
    required TResult Function() failure,
  }) {
    return failure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<({AssetEntity asset, String? link})> assets)? assets,
    TResult? Function()? failure,
  }) {
    return failure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<({AssetEntity asset, String? link})> assets)? assets,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PurchasedAssetsLoadingState value) loading,
    required TResult Function(_PurchasedAssetsState value) assets,
    required TResult Function(_PurchasedAssetsFailureState value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PurchasedAssetsLoadingState value)? loading,
    TResult? Function(_PurchasedAssetsState value)? assets,
    TResult? Function(_PurchasedAssetsFailureState value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PurchasedAssetsLoadingState value)? loading,
    TResult Function(_PurchasedAssetsState value)? assets,
    TResult Function(_PurchasedAssetsFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _PurchasedAssetsFailureState implements PurchasedAssetsState {
  const factory _PurchasedAssetsFailureState() = _$_PurchasedAssetsFailureState;
}
