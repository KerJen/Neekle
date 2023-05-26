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
mixin _$AssetState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            ({AssetEntity asset, bool inShopcart, bool isFavorite}) asset)
        asset,
    required TResult Function() failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
            ({AssetEntity asset, bool inShopcart, bool isFavorite}) asset)?
        asset,
    TResult? Function()? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            ({AssetEntity asset, bool inShopcart, bool isFavorite}) asset)?
        asset,
    TResult Function()? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AssetLoadingState value) loading,
    required TResult Function(_AssetState value) asset,
    required TResult Function(_AssetFailureState value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AssetLoadingState value)? loading,
    TResult? Function(_AssetState value)? asset,
    TResult? Function(_AssetFailureState value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AssetLoadingState value)? loading,
    TResult Function(_AssetState value)? asset,
    TResult Function(_AssetFailureState value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetStateCopyWith<$Res> {
  factory $AssetStateCopyWith(
          AssetState value, $Res Function(AssetState) then) =
      _$AssetStateCopyWithImpl<$Res, AssetState>;
}

/// @nodoc
class _$AssetStateCopyWithImpl<$Res, $Val extends AssetState>
    implements $AssetStateCopyWith<$Res> {
  _$AssetStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_AssetLoadingStateCopyWith<$Res> {
  factory _$$_AssetLoadingStateCopyWith(_$_AssetLoadingState value,
          $Res Function(_$_AssetLoadingState) then) =
      __$$_AssetLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AssetLoadingStateCopyWithImpl<$Res>
    extends _$AssetStateCopyWithImpl<$Res, _$_AssetLoadingState>
    implements _$$_AssetLoadingStateCopyWith<$Res> {
  __$$_AssetLoadingStateCopyWithImpl(
      _$_AssetLoadingState _value, $Res Function(_$_AssetLoadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_AssetLoadingState implements _AssetLoadingState {
  const _$_AssetLoadingState();

  @override
  String toString() {
    return 'AssetState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AssetLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            ({AssetEntity asset, bool inShopcart, bool isFavorite}) asset)
        asset,
    required TResult Function() failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
            ({AssetEntity asset, bool inShopcart, bool isFavorite}) asset)?
        asset,
    TResult? Function()? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            ({AssetEntity asset, bool inShopcart, bool isFavorite}) asset)?
        asset,
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
    required TResult Function(_AssetLoadingState value) loading,
    required TResult Function(_AssetState value) asset,
    required TResult Function(_AssetFailureState value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AssetLoadingState value)? loading,
    TResult? Function(_AssetState value)? asset,
    TResult? Function(_AssetFailureState value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AssetLoadingState value)? loading,
    TResult Function(_AssetState value)? asset,
    TResult Function(_AssetFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _AssetLoadingState implements AssetState {
  const factory _AssetLoadingState() = _$_AssetLoadingState;
}

/// @nodoc
abstract class _$$_AssetStateCopyWith<$Res> {
  factory _$$_AssetStateCopyWith(
          _$_AssetState value, $Res Function(_$_AssetState) then) =
      __$$_AssetStateCopyWithImpl<$Res>;
  @useResult
  $Res call({({AssetEntity asset, bool inShopcart, bool isFavorite}) asset});
}

/// @nodoc
class __$$_AssetStateCopyWithImpl<$Res>
    extends _$AssetStateCopyWithImpl<$Res, _$_AssetState>
    implements _$$_AssetStateCopyWith<$Res> {
  __$$_AssetStateCopyWithImpl(
      _$_AssetState _value, $Res Function(_$_AssetState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? asset = null,
  }) {
    return _then(_$_AssetState(
      asset: null == asset
          ? _value.asset
          : asset // ignore: cast_nullable_to_non_nullable
              as ({AssetEntity asset, bool inShopcart, bool isFavorite}),
    ));
  }
}

/// @nodoc

class _$_AssetState implements _AssetState {
  const _$_AssetState({required this.asset});

  @override
  final ({AssetEntity asset, bool inShopcart, bool isFavorite}) asset;

  @override
  String toString() {
    return 'AssetState.asset(asset: $asset)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AssetState &&
            (identical(other.asset, asset) || other.asset == asset));
  }

  @override
  int get hashCode => Object.hash(runtimeType, asset);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AssetStateCopyWith<_$_AssetState> get copyWith =>
      __$$_AssetStateCopyWithImpl<_$_AssetState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            ({AssetEntity asset, bool inShopcart, bool isFavorite}) asset)
        asset,
    required TResult Function() failure,
  }) {
    return asset(this.asset);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
            ({AssetEntity asset, bool inShopcart, bool isFavorite}) asset)?
        asset,
    TResult? Function()? failure,
  }) {
    return asset?.call(this.asset);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            ({AssetEntity asset, bool inShopcart, bool isFavorite}) asset)?
        asset,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    if (asset != null) {
      return asset(this.asset);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AssetLoadingState value) loading,
    required TResult Function(_AssetState value) asset,
    required TResult Function(_AssetFailureState value) failure,
  }) {
    return asset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AssetLoadingState value)? loading,
    TResult? Function(_AssetState value)? asset,
    TResult? Function(_AssetFailureState value)? failure,
  }) {
    return asset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AssetLoadingState value)? loading,
    TResult Function(_AssetState value)? asset,
    TResult Function(_AssetFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (asset != null) {
      return asset(this);
    }
    return orElse();
  }
}

abstract class _AssetState implements AssetState {
  const factory _AssetState(
      {required final ({
        AssetEntity asset,
        bool inShopcart,
        bool isFavorite
      }) asset}) = _$_AssetState;

  ({AssetEntity asset, bool inShopcart, bool isFavorite}) get asset;
  @JsonKey(ignore: true)
  _$$_AssetStateCopyWith<_$_AssetState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AssetFailureStateCopyWith<$Res> {
  factory _$$_AssetFailureStateCopyWith(_$_AssetFailureState value,
          $Res Function(_$_AssetFailureState) then) =
      __$$_AssetFailureStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AssetFailureStateCopyWithImpl<$Res>
    extends _$AssetStateCopyWithImpl<$Res, _$_AssetFailureState>
    implements _$$_AssetFailureStateCopyWith<$Res> {
  __$$_AssetFailureStateCopyWithImpl(
      _$_AssetFailureState _value, $Res Function(_$_AssetFailureState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_AssetFailureState implements _AssetFailureState {
  const _$_AssetFailureState();

  @override
  String toString() {
    return 'AssetState.failure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AssetFailureState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            ({AssetEntity asset, bool inShopcart, bool isFavorite}) asset)
        asset,
    required TResult Function() failure,
  }) {
    return failure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
            ({AssetEntity asset, bool inShopcart, bool isFavorite}) asset)?
        asset,
    TResult? Function()? failure,
  }) {
    return failure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            ({AssetEntity asset, bool inShopcart, bool isFavorite}) asset)?
        asset,
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
    required TResult Function(_AssetLoadingState value) loading,
    required TResult Function(_AssetState value) asset,
    required TResult Function(_AssetFailureState value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AssetLoadingState value)? loading,
    TResult? Function(_AssetState value)? asset,
    TResult? Function(_AssetFailureState value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AssetLoadingState value)? loading,
    TResult Function(_AssetState value)? asset,
    TResult Function(_AssetFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _AssetFailureState implements AssetState {
  const factory _AssetFailureState() = _$_AssetFailureState;
}
