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
mixin _$AssetsListState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            List<({AssetEntity asset, bool inShopcart})> assets)
        assets,
    required TResult Function(String message) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<({AssetEntity asset, bool inShopcart})> assets)?
        assets,
    TResult? Function(String message)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<({AssetEntity asset, bool inShopcart})> assets)?
        assets,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AssetsListLoadingState value) loading,
    required TResult Function(_AssetsListState value) assets,
    required TResult Function(_AssetsListFailureState value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AssetsListLoadingState value)? loading,
    TResult? Function(_AssetsListState value)? assets,
    TResult? Function(_AssetsListFailureState value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AssetsListLoadingState value)? loading,
    TResult Function(_AssetsListState value)? assets,
    TResult Function(_AssetsListFailureState value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetsListStateCopyWith<$Res> {
  factory $AssetsListStateCopyWith(
          AssetsListState value, $Res Function(AssetsListState) then) =
      _$AssetsListStateCopyWithImpl<$Res, AssetsListState>;
}

/// @nodoc
class _$AssetsListStateCopyWithImpl<$Res, $Val extends AssetsListState>
    implements $AssetsListStateCopyWith<$Res> {
  _$AssetsListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_AssetsListLoadingStateCopyWith<$Res> {
  factory _$$_AssetsListLoadingStateCopyWith(_$_AssetsListLoadingState value,
          $Res Function(_$_AssetsListLoadingState) then) =
      __$$_AssetsListLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AssetsListLoadingStateCopyWithImpl<$Res>
    extends _$AssetsListStateCopyWithImpl<$Res, _$_AssetsListLoadingState>
    implements _$$_AssetsListLoadingStateCopyWith<$Res> {
  __$$_AssetsListLoadingStateCopyWithImpl(_$_AssetsListLoadingState _value,
      $Res Function(_$_AssetsListLoadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_AssetsListLoadingState implements _AssetsListLoadingState {
  const _$_AssetsListLoadingState();

  @override
  String toString() {
    return 'AssetsListState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AssetsListLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            List<({AssetEntity asset, bool inShopcart})> assets)
        assets,
    required TResult Function(String message) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<({AssetEntity asset, bool inShopcart})> assets)?
        assets,
    TResult? Function(String message)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<({AssetEntity asset, bool inShopcart})> assets)?
        assets,
    TResult Function(String message)? failure,
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
    required TResult Function(_AssetsListLoadingState value) loading,
    required TResult Function(_AssetsListState value) assets,
    required TResult Function(_AssetsListFailureState value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AssetsListLoadingState value)? loading,
    TResult? Function(_AssetsListState value)? assets,
    TResult? Function(_AssetsListFailureState value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AssetsListLoadingState value)? loading,
    TResult Function(_AssetsListState value)? assets,
    TResult Function(_AssetsListFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _AssetsListLoadingState implements AssetsListState {
  const factory _AssetsListLoadingState() = _$_AssetsListLoadingState;
}

/// @nodoc
abstract class _$$_AssetsListStateCopyWith<$Res> {
  factory _$$_AssetsListStateCopyWith(
          _$_AssetsListState value, $Res Function(_$_AssetsListState) then) =
      __$$_AssetsListStateCopyWithImpl<$Res>;
  @useResult
  $Res call({List<({AssetEntity asset, bool inShopcart})> assets});
}

/// @nodoc
class __$$_AssetsListStateCopyWithImpl<$Res>
    extends _$AssetsListStateCopyWithImpl<$Res, _$_AssetsListState>
    implements _$$_AssetsListStateCopyWith<$Res> {
  __$$_AssetsListStateCopyWithImpl(
      _$_AssetsListState _value, $Res Function(_$_AssetsListState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assets = null,
  }) {
    return _then(_$_AssetsListState(
      assets: null == assets
          ? _value._assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<({AssetEntity asset, bool inShopcart})>,
    ));
  }
}

/// @nodoc

class _$_AssetsListState implements _AssetsListState {
  const _$_AssetsListState(
      {required final List<({AssetEntity asset, bool inShopcart})> assets})
      : _assets = assets;

  final List<({AssetEntity asset, bool inShopcart})> _assets;
  @override
  List<({AssetEntity asset, bool inShopcart})> get assets {
    if (_assets is EqualUnmodifiableListView) return _assets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assets);
  }

  @override
  String toString() {
    return 'AssetsListState.assets(assets: $assets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AssetsListState &&
            const DeepCollectionEquality().equals(other._assets, _assets));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_assets));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AssetsListStateCopyWith<_$_AssetsListState> get copyWith =>
      __$$_AssetsListStateCopyWithImpl<_$_AssetsListState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            List<({AssetEntity asset, bool inShopcart})> assets)
        assets,
    required TResult Function(String message) failure,
  }) {
    return assets(this.assets);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<({AssetEntity asset, bool inShopcart})> assets)?
        assets,
    TResult? Function(String message)? failure,
  }) {
    return assets?.call(this.assets);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<({AssetEntity asset, bool inShopcart})> assets)?
        assets,
    TResult Function(String message)? failure,
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
    required TResult Function(_AssetsListLoadingState value) loading,
    required TResult Function(_AssetsListState value) assets,
    required TResult Function(_AssetsListFailureState value) failure,
  }) {
    return assets(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AssetsListLoadingState value)? loading,
    TResult? Function(_AssetsListState value)? assets,
    TResult? Function(_AssetsListFailureState value)? failure,
  }) {
    return assets?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AssetsListLoadingState value)? loading,
    TResult Function(_AssetsListState value)? assets,
    TResult Function(_AssetsListFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (assets != null) {
      return assets(this);
    }
    return orElse();
  }
}

abstract class _AssetsListState implements AssetsListState {
  const factory _AssetsListState(
      {required final List<({AssetEntity asset, bool inShopcart})>
          assets}) = _$_AssetsListState;

  List<({AssetEntity asset, bool inShopcart})> get assets;
  @JsonKey(ignore: true)
  _$$_AssetsListStateCopyWith<_$_AssetsListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AssetsListFailureStateCopyWith<$Res> {
  factory _$$_AssetsListFailureStateCopyWith(_$_AssetsListFailureState value,
          $Res Function(_$_AssetsListFailureState) then) =
      __$$_AssetsListFailureStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_AssetsListFailureStateCopyWithImpl<$Res>
    extends _$AssetsListStateCopyWithImpl<$Res, _$_AssetsListFailureState>
    implements _$$_AssetsListFailureStateCopyWith<$Res> {
  __$$_AssetsListFailureStateCopyWithImpl(_$_AssetsListFailureState _value,
      $Res Function(_$_AssetsListFailureState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_AssetsListFailureState(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AssetsListFailureState implements _AssetsListFailureState {
  const _$_AssetsListFailureState({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'AssetsListState.failure(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AssetsListFailureState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AssetsListFailureStateCopyWith<_$_AssetsListFailureState> get copyWith =>
      __$$_AssetsListFailureStateCopyWithImpl<_$_AssetsListFailureState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            List<({AssetEntity asset, bool inShopcart})> assets)
        assets,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<({AssetEntity asset, bool inShopcart})> assets)?
        assets,
    TResult? Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<({AssetEntity asset, bool inShopcart})> assets)?
        assets,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AssetsListLoadingState value) loading,
    required TResult Function(_AssetsListState value) assets,
    required TResult Function(_AssetsListFailureState value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AssetsListLoadingState value)? loading,
    TResult? Function(_AssetsListState value)? assets,
    TResult? Function(_AssetsListFailureState value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AssetsListLoadingState value)? loading,
    TResult Function(_AssetsListState value)? assets,
    TResult Function(_AssetsListFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _AssetsListFailureState implements AssetsListState {
  const factory _AssetsListFailureState({required final String message}) =
      _$_AssetsListFailureState;

  String get message;
  @JsonKey(ignore: true)
  _$$_AssetsListFailureStateCopyWith<_$_AssetsListFailureState> get copyWith =>
      throw _privateConstructorUsedError;
}
