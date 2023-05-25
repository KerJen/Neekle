// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state_button.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StateButtonState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Widget child) base,
    required TResult Function() loading,
    required TResult Function(Widget child) success,
    required TResult Function(String message) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Widget child)? base,
    TResult? Function()? loading,
    TResult? Function(Widget child)? success,
    TResult? Function(String message)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Widget child)? base,
    TResult Function()? loading,
    TResult Function(Widget child)? success,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BaseStateButtonState value) base,
    required TResult Function(_LoadingStateButtonState value) loading,
    required TResult Function(_SuccessStateButtonState value) success,
    required TResult Function(_FailedStateButtonState value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_BaseStateButtonState value)? base,
    TResult? Function(_LoadingStateButtonState value)? loading,
    TResult? Function(_SuccessStateButtonState value)? success,
    TResult? Function(_FailedStateButtonState value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BaseStateButtonState value)? base,
    TResult Function(_LoadingStateButtonState value)? loading,
    TResult Function(_SuccessStateButtonState value)? success,
    TResult Function(_FailedStateButtonState value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StateButtonStateCopyWith<$Res> {
  factory $StateButtonStateCopyWith(
          StateButtonState value, $Res Function(StateButtonState) then) =
      _$StateButtonStateCopyWithImpl<$Res, StateButtonState>;
}

/// @nodoc
class _$StateButtonStateCopyWithImpl<$Res, $Val extends StateButtonState>
    implements $StateButtonStateCopyWith<$Res> {
  _$StateButtonStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_BaseStateButtonStateCopyWith<$Res> {
  factory _$$_BaseStateButtonStateCopyWith(_$_BaseStateButtonState value,
          $Res Function(_$_BaseStateButtonState) then) =
      __$$_BaseStateButtonStateCopyWithImpl<$Res>;
  @useResult
  $Res call({Widget child});
}

/// @nodoc
class __$$_BaseStateButtonStateCopyWithImpl<$Res>
    extends _$StateButtonStateCopyWithImpl<$Res, _$_BaseStateButtonState>
    implements _$$_BaseStateButtonStateCopyWith<$Res> {
  __$$_BaseStateButtonStateCopyWithImpl(_$_BaseStateButtonState _value,
      $Res Function(_$_BaseStateButtonState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? child = null,
  }) {
    return _then(_$_BaseStateButtonState(
      child: null == child
          ? _value.child
          : child // ignore: cast_nullable_to_non_nullable
              as Widget,
    ));
  }
}

/// @nodoc

class _$_BaseStateButtonState implements _BaseStateButtonState {
  const _$_BaseStateButtonState({required this.child});

  @override
  final Widget child;

  @override
  String toString() {
    return 'StateButtonState.base(child: $child)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BaseStateButtonState &&
            (identical(other.child, child) || other.child == child));
  }

  @override
  int get hashCode => Object.hash(runtimeType, child);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BaseStateButtonStateCopyWith<_$_BaseStateButtonState> get copyWith =>
      __$$_BaseStateButtonStateCopyWithImpl<_$_BaseStateButtonState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Widget child) base,
    required TResult Function() loading,
    required TResult Function(Widget child) success,
    required TResult Function(String message) failed,
  }) {
    return base(child);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Widget child)? base,
    TResult? Function()? loading,
    TResult? Function(Widget child)? success,
    TResult? Function(String message)? failed,
  }) {
    return base?.call(child);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Widget child)? base,
    TResult Function()? loading,
    TResult Function(Widget child)? success,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (base != null) {
      return base(child);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BaseStateButtonState value) base,
    required TResult Function(_LoadingStateButtonState value) loading,
    required TResult Function(_SuccessStateButtonState value) success,
    required TResult Function(_FailedStateButtonState value) failed,
  }) {
    return base(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_BaseStateButtonState value)? base,
    TResult? Function(_LoadingStateButtonState value)? loading,
    TResult? Function(_SuccessStateButtonState value)? success,
    TResult? Function(_FailedStateButtonState value)? failed,
  }) {
    return base?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BaseStateButtonState value)? base,
    TResult Function(_LoadingStateButtonState value)? loading,
    TResult Function(_SuccessStateButtonState value)? success,
    TResult Function(_FailedStateButtonState value)? failed,
    required TResult orElse(),
  }) {
    if (base != null) {
      return base(this);
    }
    return orElse();
  }
}

abstract class _BaseStateButtonState implements StateButtonState {
  const factory _BaseStateButtonState({required final Widget child}) =
      _$_BaseStateButtonState;

  Widget get child;
  @JsonKey(ignore: true)
  _$$_BaseStateButtonStateCopyWith<_$_BaseStateButtonState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadingStateButtonStateCopyWith<$Res> {
  factory _$$_LoadingStateButtonStateCopyWith(_$_LoadingStateButtonState value,
          $Res Function(_$_LoadingStateButtonState) then) =
      __$$_LoadingStateButtonStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingStateButtonStateCopyWithImpl<$Res>
    extends _$StateButtonStateCopyWithImpl<$Res, _$_LoadingStateButtonState>
    implements _$$_LoadingStateButtonStateCopyWith<$Res> {
  __$$_LoadingStateButtonStateCopyWithImpl(_$_LoadingStateButtonState _value,
      $Res Function(_$_LoadingStateButtonState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LoadingStateButtonState implements _LoadingStateButtonState {
  const _$_LoadingStateButtonState();

  @override
  String toString() {
    return 'StateButtonState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadingStateButtonState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Widget child) base,
    required TResult Function() loading,
    required TResult Function(Widget child) success,
    required TResult Function(String message) failed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Widget child)? base,
    TResult? Function()? loading,
    TResult? Function(Widget child)? success,
    TResult? Function(String message)? failed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Widget child)? base,
    TResult Function()? loading,
    TResult Function(Widget child)? success,
    TResult Function(String message)? failed,
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
    required TResult Function(_BaseStateButtonState value) base,
    required TResult Function(_LoadingStateButtonState value) loading,
    required TResult Function(_SuccessStateButtonState value) success,
    required TResult Function(_FailedStateButtonState value) failed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_BaseStateButtonState value)? base,
    TResult? Function(_LoadingStateButtonState value)? loading,
    TResult? Function(_SuccessStateButtonState value)? success,
    TResult? Function(_FailedStateButtonState value)? failed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BaseStateButtonState value)? base,
    TResult Function(_LoadingStateButtonState value)? loading,
    TResult Function(_SuccessStateButtonState value)? success,
    TResult Function(_FailedStateButtonState value)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _LoadingStateButtonState implements StateButtonState {
  const factory _LoadingStateButtonState() = _$_LoadingStateButtonState;
}

/// @nodoc
abstract class _$$_SuccessStateButtonStateCopyWith<$Res> {
  factory _$$_SuccessStateButtonStateCopyWith(_$_SuccessStateButtonState value,
          $Res Function(_$_SuccessStateButtonState) then) =
      __$$_SuccessStateButtonStateCopyWithImpl<$Res>;
  @useResult
  $Res call({Widget child});
}

/// @nodoc
class __$$_SuccessStateButtonStateCopyWithImpl<$Res>
    extends _$StateButtonStateCopyWithImpl<$Res, _$_SuccessStateButtonState>
    implements _$$_SuccessStateButtonStateCopyWith<$Res> {
  __$$_SuccessStateButtonStateCopyWithImpl(_$_SuccessStateButtonState _value,
      $Res Function(_$_SuccessStateButtonState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? child = null,
  }) {
    return _then(_$_SuccessStateButtonState(
      child: null == child
          ? _value.child
          : child // ignore: cast_nullable_to_non_nullable
              as Widget,
    ));
  }
}

/// @nodoc

class _$_SuccessStateButtonState implements _SuccessStateButtonState {
  const _$_SuccessStateButtonState(
      {this.child = const Icon(Icons.done, color: Colors.white)});

  @override
  @JsonKey()
  final Widget child;

  @override
  String toString() {
    return 'StateButtonState.success(child: $child)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SuccessStateButtonState &&
            (identical(other.child, child) || other.child == child));
  }

  @override
  int get hashCode => Object.hash(runtimeType, child);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SuccessStateButtonStateCopyWith<_$_SuccessStateButtonState>
      get copyWith =>
          __$$_SuccessStateButtonStateCopyWithImpl<_$_SuccessStateButtonState>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Widget child) base,
    required TResult Function() loading,
    required TResult Function(Widget child) success,
    required TResult Function(String message) failed,
  }) {
    return success(child);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Widget child)? base,
    TResult? Function()? loading,
    TResult? Function(Widget child)? success,
    TResult? Function(String message)? failed,
  }) {
    return success?.call(child);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Widget child)? base,
    TResult Function()? loading,
    TResult Function(Widget child)? success,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(child);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BaseStateButtonState value) base,
    required TResult Function(_LoadingStateButtonState value) loading,
    required TResult Function(_SuccessStateButtonState value) success,
    required TResult Function(_FailedStateButtonState value) failed,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_BaseStateButtonState value)? base,
    TResult? Function(_LoadingStateButtonState value)? loading,
    TResult? Function(_SuccessStateButtonState value)? success,
    TResult? Function(_FailedStateButtonState value)? failed,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BaseStateButtonState value)? base,
    TResult Function(_LoadingStateButtonState value)? loading,
    TResult Function(_SuccessStateButtonState value)? success,
    TResult Function(_FailedStateButtonState value)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _SuccessStateButtonState implements StateButtonState {
  const factory _SuccessStateButtonState({final Widget child}) =
      _$_SuccessStateButtonState;

  Widget get child;
  @JsonKey(ignore: true)
  _$$_SuccessStateButtonStateCopyWith<_$_SuccessStateButtonState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FailedStateButtonStateCopyWith<$Res> {
  factory _$$_FailedStateButtonStateCopyWith(_$_FailedStateButtonState value,
          $Res Function(_$_FailedStateButtonState) then) =
      __$$_FailedStateButtonStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_FailedStateButtonStateCopyWithImpl<$Res>
    extends _$StateButtonStateCopyWithImpl<$Res, _$_FailedStateButtonState>
    implements _$$_FailedStateButtonStateCopyWith<$Res> {
  __$$_FailedStateButtonStateCopyWithImpl(_$_FailedStateButtonState _value,
      $Res Function(_$_FailedStateButtonState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_FailedStateButtonState(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FailedStateButtonState implements _FailedStateButtonState {
  const _$_FailedStateButtonState({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'StateButtonState.failed(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FailedStateButtonState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FailedStateButtonStateCopyWith<_$_FailedStateButtonState> get copyWith =>
      __$$_FailedStateButtonStateCopyWithImpl<_$_FailedStateButtonState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Widget child) base,
    required TResult Function() loading,
    required TResult Function(Widget child) success,
    required TResult Function(String message) failed,
  }) {
    return failed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Widget child)? base,
    TResult? Function()? loading,
    TResult? Function(Widget child)? success,
    TResult? Function(String message)? failed,
  }) {
    return failed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Widget child)? base,
    TResult Function()? loading,
    TResult Function(Widget child)? success,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BaseStateButtonState value) base,
    required TResult Function(_LoadingStateButtonState value) loading,
    required TResult Function(_SuccessStateButtonState value) success,
    required TResult Function(_FailedStateButtonState value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_BaseStateButtonState value)? base,
    TResult? Function(_LoadingStateButtonState value)? loading,
    TResult? Function(_SuccessStateButtonState value)? success,
    TResult? Function(_FailedStateButtonState value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BaseStateButtonState value)? base,
    TResult Function(_LoadingStateButtonState value)? loading,
    TResult Function(_SuccessStateButtonState value)? success,
    TResult Function(_FailedStateButtonState value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _FailedStateButtonState implements StateButtonState {
  const factory _FailedStateButtonState({required final String message}) =
      _$_FailedStateButtonState;

  String get message;
  @JsonKey(ignore: true)
  _$$_FailedStateButtonStateCopyWith<_$_FailedStateButtonState> get copyWith =>
      throw _privateConstructorUsedError;
}
