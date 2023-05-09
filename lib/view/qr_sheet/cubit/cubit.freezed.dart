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
mixin _$QrState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String data) qr,
    required TResult Function() auth,
    required TResult Function(String message) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String data)? qr,
    TResult? Function()? auth,
    TResult? Function(String message)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String data)? qr,
    TResult Function()? auth,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_QrLoadingState value) loading,
    required TResult Function(_QrState value) qr,
    required TResult Function(_QrAuthState value) auth,
    required TResult Function(_QrFailureState value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_QrLoadingState value)? loading,
    TResult? Function(_QrState value)? qr,
    TResult? Function(_QrAuthState value)? auth,
    TResult? Function(_QrFailureState value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_QrLoadingState value)? loading,
    TResult Function(_QrState value)? qr,
    TResult Function(_QrAuthState value)? auth,
    TResult Function(_QrFailureState value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QrStateCopyWith<$Res> {
  factory $QrStateCopyWith(QrState value, $Res Function(QrState) then) =
      _$QrStateCopyWithImpl<$Res, QrState>;
}

/// @nodoc
class _$QrStateCopyWithImpl<$Res, $Val extends QrState>
    implements $QrStateCopyWith<$Res> {
  _$QrStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_QrLoadingStateCopyWith<$Res> {
  factory _$$_QrLoadingStateCopyWith(
          _$_QrLoadingState value, $Res Function(_$_QrLoadingState) then) =
      __$$_QrLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_QrLoadingStateCopyWithImpl<$Res>
    extends _$QrStateCopyWithImpl<$Res, _$_QrLoadingState>
    implements _$$_QrLoadingStateCopyWith<$Res> {
  __$$_QrLoadingStateCopyWithImpl(
      _$_QrLoadingState _value, $Res Function(_$_QrLoadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_QrLoadingState implements _QrLoadingState {
  const _$_QrLoadingState();

  @override
  String toString() {
    return 'QrState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_QrLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String data) qr,
    required TResult Function() auth,
    required TResult Function(String message) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String data)? qr,
    TResult? Function()? auth,
    TResult? Function(String message)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String data)? qr,
    TResult Function()? auth,
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
    required TResult Function(_QrLoadingState value) loading,
    required TResult Function(_QrState value) qr,
    required TResult Function(_QrAuthState value) auth,
    required TResult Function(_QrFailureState value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_QrLoadingState value)? loading,
    TResult? Function(_QrState value)? qr,
    TResult? Function(_QrAuthState value)? auth,
    TResult? Function(_QrFailureState value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_QrLoadingState value)? loading,
    TResult Function(_QrState value)? qr,
    TResult Function(_QrAuthState value)? auth,
    TResult Function(_QrFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _QrLoadingState implements QrState {
  const factory _QrLoadingState() = _$_QrLoadingState;
}

/// @nodoc
abstract class _$$_QrStateCopyWith<$Res> {
  factory _$$_QrStateCopyWith(
          _$_QrState value, $Res Function(_$_QrState) then) =
      __$$_QrStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String data});
}

/// @nodoc
class __$$_QrStateCopyWithImpl<$Res>
    extends _$QrStateCopyWithImpl<$Res, _$_QrState>
    implements _$$_QrStateCopyWith<$Res> {
  __$$_QrStateCopyWithImpl(_$_QrState _value, $Res Function(_$_QrState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_QrState(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_QrState implements _QrState {
  const _$_QrState({required this.data});

  @override
  final String data;

  @override
  String toString() {
    return 'QrState.qr(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QrState &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QrStateCopyWith<_$_QrState> get copyWith =>
      __$$_QrStateCopyWithImpl<_$_QrState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String data) qr,
    required TResult Function() auth,
    required TResult Function(String message) failure,
  }) {
    return qr(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String data)? qr,
    TResult? Function()? auth,
    TResult? Function(String message)? failure,
  }) {
    return qr?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String data)? qr,
    TResult Function()? auth,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (qr != null) {
      return qr(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_QrLoadingState value) loading,
    required TResult Function(_QrState value) qr,
    required TResult Function(_QrAuthState value) auth,
    required TResult Function(_QrFailureState value) failure,
  }) {
    return qr(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_QrLoadingState value)? loading,
    TResult? Function(_QrState value)? qr,
    TResult? Function(_QrAuthState value)? auth,
    TResult? Function(_QrFailureState value)? failure,
  }) {
    return qr?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_QrLoadingState value)? loading,
    TResult Function(_QrState value)? qr,
    TResult Function(_QrAuthState value)? auth,
    TResult Function(_QrFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (qr != null) {
      return qr(this);
    }
    return orElse();
  }
}

abstract class _QrState implements QrState {
  const factory _QrState({required final String data}) = _$_QrState;

  String get data;
  @JsonKey(ignore: true)
  _$$_QrStateCopyWith<_$_QrState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_QrAuthStateCopyWith<$Res> {
  factory _$$_QrAuthStateCopyWith(
          _$_QrAuthState value, $Res Function(_$_QrAuthState) then) =
      __$$_QrAuthStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_QrAuthStateCopyWithImpl<$Res>
    extends _$QrStateCopyWithImpl<$Res, _$_QrAuthState>
    implements _$$_QrAuthStateCopyWith<$Res> {
  __$$_QrAuthStateCopyWithImpl(
      _$_QrAuthState _value, $Res Function(_$_QrAuthState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_QrAuthState implements _QrAuthState {
  const _$_QrAuthState();

  @override
  String toString() {
    return 'QrState.auth()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_QrAuthState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String data) qr,
    required TResult Function() auth,
    required TResult Function(String message) failure,
  }) {
    return auth();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String data)? qr,
    TResult? Function()? auth,
    TResult? Function(String message)? failure,
  }) {
    return auth?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String data)? qr,
    TResult Function()? auth,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (auth != null) {
      return auth();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_QrLoadingState value) loading,
    required TResult Function(_QrState value) qr,
    required TResult Function(_QrAuthState value) auth,
    required TResult Function(_QrFailureState value) failure,
  }) {
    return auth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_QrLoadingState value)? loading,
    TResult? Function(_QrState value)? qr,
    TResult? Function(_QrAuthState value)? auth,
    TResult? Function(_QrFailureState value)? failure,
  }) {
    return auth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_QrLoadingState value)? loading,
    TResult Function(_QrState value)? qr,
    TResult Function(_QrAuthState value)? auth,
    TResult Function(_QrFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (auth != null) {
      return auth(this);
    }
    return orElse();
  }
}

abstract class _QrAuthState implements QrState {
  const factory _QrAuthState() = _$_QrAuthState;
}

/// @nodoc
abstract class _$$_QrFailureStateCopyWith<$Res> {
  factory _$$_QrFailureStateCopyWith(
          _$_QrFailureState value, $Res Function(_$_QrFailureState) then) =
      __$$_QrFailureStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_QrFailureStateCopyWithImpl<$Res>
    extends _$QrStateCopyWithImpl<$Res, _$_QrFailureState>
    implements _$$_QrFailureStateCopyWith<$Res> {
  __$$_QrFailureStateCopyWithImpl(
      _$_QrFailureState _value, $Res Function(_$_QrFailureState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_QrFailureState(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_QrFailureState implements _QrFailureState {
  const _$_QrFailureState({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'QrState.failure(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QrFailureState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QrFailureStateCopyWith<_$_QrFailureState> get copyWith =>
      __$$_QrFailureStateCopyWithImpl<_$_QrFailureState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String data) qr,
    required TResult Function() auth,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String data)? qr,
    TResult? Function()? auth,
    TResult? Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String data)? qr,
    TResult Function()? auth,
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
    required TResult Function(_QrLoadingState value) loading,
    required TResult Function(_QrState value) qr,
    required TResult Function(_QrAuthState value) auth,
    required TResult Function(_QrFailureState value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_QrLoadingState value)? loading,
    TResult? Function(_QrState value)? qr,
    TResult? Function(_QrAuthState value)? auth,
    TResult? Function(_QrFailureState value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_QrLoadingState value)? loading,
    TResult Function(_QrState value)? qr,
    TResult Function(_QrAuthState value)? auth,
    TResult Function(_QrFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _QrFailureState implements QrState {
  const factory _QrFailureState({required final String message}) =
      _$_QrFailureState;

  String get message;
  @JsonKey(ignore: true)
  _$$_QrFailureStateCopyWith<_$_QrFailureState> get copyWith =>
      throw _privateConstructorUsedError;
}
