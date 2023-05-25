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
mixin _$ShopcartState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<AssetEntity> assets) cart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<AssetEntity> assets)? cart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<AssetEntity> assets)? cart,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ShopcartLoadingState value) loading,
    required TResult Function(_ShopcartState value) cart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ShopcartLoadingState value)? loading,
    TResult? Function(_ShopcartState value)? cart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ShopcartLoadingState value)? loading,
    TResult Function(_ShopcartState value)? cart,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopcartStateCopyWith<$Res> {
  factory $ShopcartStateCopyWith(
          ShopcartState value, $Res Function(ShopcartState) then) =
      _$ShopcartStateCopyWithImpl<$Res, ShopcartState>;
}

/// @nodoc
class _$ShopcartStateCopyWithImpl<$Res, $Val extends ShopcartState>
    implements $ShopcartStateCopyWith<$Res> {
  _$ShopcartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_ShopcartLoadingStateCopyWith<$Res> {
  factory _$$_ShopcartLoadingStateCopyWith(_$_ShopcartLoadingState value,
          $Res Function(_$_ShopcartLoadingState) then) =
      __$$_ShopcartLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ShopcartLoadingStateCopyWithImpl<$Res>
    extends _$ShopcartStateCopyWithImpl<$Res, _$_ShopcartLoadingState>
    implements _$$_ShopcartLoadingStateCopyWith<$Res> {
  __$$_ShopcartLoadingStateCopyWithImpl(_$_ShopcartLoadingState _value,
      $Res Function(_$_ShopcartLoadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ShopcartLoadingState implements _ShopcartLoadingState {
  const _$_ShopcartLoadingState();

  @override
  String toString() {
    return 'ShopcartState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ShopcartLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<AssetEntity> assets) cart,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<AssetEntity> assets)? cart,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<AssetEntity> assets)? cart,
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
    required TResult Function(_ShopcartLoadingState value) loading,
    required TResult Function(_ShopcartState value) cart,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ShopcartLoadingState value)? loading,
    TResult? Function(_ShopcartState value)? cart,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ShopcartLoadingState value)? loading,
    TResult Function(_ShopcartState value)? cart,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _ShopcartLoadingState implements ShopcartState {
  const factory _ShopcartLoadingState() = _$_ShopcartLoadingState;
}

/// @nodoc
abstract class _$$_ShopcartStateCopyWith<$Res> {
  factory _$$_ShopcartStateCopyWith(
          _$_ShopcartState value, $Res Function(_$_ShopcartState) then) =
      __$$_ShopcartStateCopyWithImpl<$Res>;
  @useResult
  $Res call({List<AssetEntity> assets});
}

/// @nodoc
class __$$_ShopcartStateCopyWithImpl<$Res>
    extends _$ShopcartStateCopyWithImpl<$Res, _$_ShopcartState>
    implements _$$_ShopcartStateCopyWith<$Res> {
  __$$_ShopcartStateCopyWithImpl(
      _$_ShopcartState _value, $Res Function(_$_ShopcartState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assets = null,
  }) {
    return _then(_$_ShopcartState(
      assets: null == assets
          ? _value._assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<AssetEntity>,
    ));
  }
}

/// @nodoc

class _$_ShopcartState implements _ShopcartState {
  const _$_ShopcartState({required final List<AssetEntity> assets})
      : _assets = assets;

  final List<AssetEntity> _assets;
  @override
  List<AssetEntity> get assets {
    if (_assets is EqualUnmodifiableListView) return _assets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assets);
  }

  @override
  String toString() {
    return 'ShopcartState.cart(assets: $assets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShopcartState &&
            const DeepCollectionEquality().equals(other._assets, _assets));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_assets));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShopcartStateCopyWith<_$_ShopcartState> get copyWith =>
      __$$_ShopcartStateCopyWithImpl<_$_ShopcartState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<AssetEntity> assets) cart,
  }) {
    return cart(assets);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<AssetEntity> assets)? cart,
  }) {
    return cart?.call(assets);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<AssetEntity> assets)? cart,
    required TResult orElse(),
  }) {
    if (cart != null) {
      return cart(assets);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ShopcartLoadingState value) loading,
    required TResult Function(_ShopcartState value) cart,
  }) {
    return cart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ShopcartLoadingState value)? loading,
    TResult? Function(_ShopcartState value)? cart,
  }) {
    return cart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ShopcartLoadingState value)? loading,
    TResult Function(_ShopcartState value)? cart,
    required TResult orElse(),
  }) {
    if (cart != null) {
      return cart(this);
    }
    return orElse();
  }
}

abstract class _ShopcartState implements ShopcartState {
  const factory _ShopcartState({required final List<AssetEntity> assets}) =
      _$_ShopcartState;

  List<AssetEntity> get assets;
  @JsonKey(ignore: true)
  _$$_ShopcartStateCopyWith<_$_ShopcartState> get copyWith =>
      throw _privateConstructorUsedError;
}
