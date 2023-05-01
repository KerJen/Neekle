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
mixin _$ProfileState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String data) qr,
    required TResult Function(ProfileEntity? profile) profile,
    required TResult Function(String message) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String data)? qr,
    TResult? Function(ProfileEntity? profile)? profile,
    TResult? Function(String message)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String data)? qr,
    TResult Function(ProfileEntity? profile)? profile,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ProfileLoadingState value) loading,
    required TResult Function(_ProfileQrState value) qr,
    required TResult Function(_ProfileState value) profile,
    required TResult Function(_ProfileFailureState value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ProfileLoadingState value)? loading,
    TResult? Function(_ProfileQrState value)? qr,
    TResult? Function(_ProfileState value)? profile,
    TResult? Function(_ProfileFailureState value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ProfileLoadingState value)? loading,
    TResult Function(_ProfileQrState value)? qr,
    TResult Function(_ProfileState value)? profile,
    TResult Function(_ProfileFailureState value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
          ProfileState value, $Res Function(ProfileState) then) =
      _$ProfileStateCopyWithImpl<$Res, ProfileState>;
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res, $Val extends ProfileState>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_ProfileLoadingStateCopyWith<$Res> {
  factory _$$_ProfileLoadingStateCopyWith(_$_ProfileLoadingState value,
          $Res Function(_$_ProfileLoadingState) then) =
      __$$_ProfileLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ProfileLoadingStateCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$_ProfileLoadingState>
    implements _$$_ProfileLoadingStateCopyWith<$Res> {
  __$$_ProfileLoadingStateCopyWithImpl(_$_ProfileLoadingState _value,
      $Res Function(_$_ProfileLoadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ProfileLoadingState implements _ProfileLoadingState {
  const _$_ProfileLoadingState();

  @override
  String toString() {
    return 'ProfileState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ProfileLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String data) qr,
    required TResult Function(ProfileEntity? profile) profile,
    required TResult Function(String message) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String data)? qr,
    TResult? Function(ProfileEntity? profile)? profile,
    TResult? Function(String message)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String data)? qr,
    TResult Function(ProfileEntity? profile)? profile,
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
    required TResult Function(_ProfileLoadingState value) loading,
    required TResult Function(_ProfileQrState value) qr,
    required TResult Function(_ProfileState value) profile,
    required TResult Function(_ProfileFailureState value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ProfileLoadingState value)? loading,
    TResult? Function(_ProfileQrState value)? qr,
    TResult? Function(_ProfileState value)? profile,
    TResult? Function(_ProfileFailureState value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ProfileLoadingState value)? loading,
    TResult Function(_ProfileQrState value)? qr,
    TResult Function(_ProfileState value)? profile,
    TResult Function(_ProfileFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _ProfileLoadingState implements ProfileState {
  const factory _ProfileLoadingState() = _$_ProfileLoadingState;
}

/// @nodoc
abstract class _$$_ProfileQrStateCopyWith<$Res> {
  factory _$$_ProfileQrStateCopyWith(
          _$_ProfileQrState value, $Res Function(_$_ProfileQrState) then) =
      __$$_ProfileQrStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String data});
}

/// @nodoc
class __$$_ProfileQrStateCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$_ProfileQrState>
    implements _$$_ProfileQrStateCopyWith<$Res> {
  __$$_ProfileQrStateCopyWithImpl(
      _$_ProfileQrState _value, $Res Function(_$_ProfileQrState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_ProfileQrState(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ProfileQrState implements _ProfileQrState {
  const _$_ProfileQrState({required this.data});

  @override
  final String data;

  @override
  String toString() {
    return 'ProfileState.qr(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfileQrState &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileQrStateCopyWith<_$_ProfileQrState> get copyWith =>
      __$$_ProfileQrStateCopyWithImpl<_$_ProfileQrState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String data) qr,
    required TResult Function(ProfileEntity? profile) profile,
    required TResult Function(String message) failure,
  }) {
    return qr(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String data)? qr,
    TResult? Function(ProfileEntity? profile)? profile,
    TResult? Function(String message)? failure,
  }) {
    return qr?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String data)? qr,
    TResult Function(ProfileEntity? profile)? profile,
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
    required TResult Function(_ProfileLoadingState value) loading,
    required TResult Function(_ProfileQrState value) qr,
    required TResult Function(_ProfileState value) profile,
    required TResult Function(_ProfileFailureState value) failure,
  }) {
    return qr(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ProfileLoadingState value)? loading,
    TResult? Function(_ProfileQrState value)? qr,
    TResult? Function(_ProfileState value)? profile,
    TResult? Function(_ProfileFailureState value)? failure,
  }) {
    return qr?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ProfileLoadingState value)? loading,
    TResult Function(_ProfileQrState value)? qr,
    TResult Function(_ProfileState value)? profile,
    TResult Function(_ProfileFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (qr != null) {
      return qr(this);
    }
    return orElse();
  }
}

abstract class _ProfileQrState implements ProfileState {
  const factory _ProfileQrState({required final String data}) =
      _$_ProfileQrState;

  String get data;
  @JsonKey(ignore: true)
  _$$_ProfileQrStateCopyWith<_$_ProfileQrState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ProfileStateCopyWith<$Res> {
  factory _$$_ProfileStateCopyWith(
          _$_ProfileState value, $Res Function(_$_ProfileState) then) =
      __$$_ProfileStateCopyWithImpl<$Res>;
  @useResult
  $Res call({ProfileEntity? profile});

  $ProfileEntityCopyWith<$Res>? get profile;
}

/// @nodoc
class __$$_ProfileStateCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$_ProfileState>
    implements _$$_ProfileStateCopyWith<$Res> {
  __$$_ProfileStateCopyWithImpl(
      _$_ProfileState _value, $Res Function(_$_ProfileState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = freezed,
  }) {
    return _then(_$_ProfileState(
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as ProfileEntity?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileEntityCopyWith<$Res>? get profile {
    if (_value.profile == null) {
      return null;
    }

    return $ProfileEntityCopyWith<$Res>(_value.profile!, (value) {
      return _then(_value.copyWith(profile: value));
    });
  }
}

/// @nodoc

class _$_ProfileState implements _ProfileState {
  const _$_ProfileState({required this.profile});

  @override
  final ProfileEntity? profile;

  @override
  String toString() {
    return 'ProfileState.profile(profile: $profile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfileState &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileStateCopyWith<_$_ProfileState> get copyWith =>
      __$$_ProfileStateCopyWithImpl<_$_ProfileState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String data) qr,
    required TResult Function(ProfileEntity? profile) profile,
    required TResult Function(String message) failure,
  }) {
    return profile(this.profile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String data)? qr,
    TResult? Function(ProfileEntity? profile)? profile,
    TResult? Function(String message)? failure,
  }) {
    return profile?.call(this.profile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String data)? qr,
    TResult Function(ProfileEntity? profile)? profile,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (profile != null) {
      return profile(this.profile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ProfileLoadingState value) loading,
    required TResult Function(_ProfileQrState value) qr,
    required TResult Function(_ProfileState value) profile,
    required TResult Function(_ProfileFailureState value) failure,
  }) {
    return profile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ProfileLoadingState value)? loading,
    TResult? Function(_ProfileQrState value)? qr,
    TResult? Function(_ProfileState value)? profile,
    TResult? Function(_ProfileFailureState value)? failure,
  }) {
    return profile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ProfileLoadingState value)? loading,
    TResult Function(_ProfileQrState value)? qr,
    TResult Function(_ProfileState value)? profile,
    TResult Function(_ProfileFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (profile != null) {
      return profile(this);
    }
    return orElse();
  }
}

abstract class _ProfileState implements ProfileState {
  const factory _ProfileState({required final ProfileEntity? profile}) =
      _$_ProfileState;

  ProfileEntity? get profile;
  @JsonKey(ignore: true)
  _$$_ProfileStateCopyWith<_$_ProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ProfileFailureStateCopyWith<$Res> {
  factory _$$_ProfileFailureStateCopyWith(_$_ProfileFailureState value,
          $Res Function(_$_ProfileFailureState) then) =
      __$$_ProfileFailureStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_ProfileFailureStateCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$_ProfileFailureState>
    implements _$$_ProfileFailureStateCopyWith<$Res> {
  __$$_ProfileFailureStateCopyWithImpl(_$_ProfileFailureState _value,
      $Res Function(_$_ProfileFailureState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_ProfileFailureState(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ProfileFailureState implements _ProfileFailureState {
  const _$_ProfileFailureState({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'ProfileState.failure(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfileFailureState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileFailureStateCopyWith<_$_ProfileFailureState> get copyWith =>
      __$$_ProfileFailureStateCopyWithImpl<_$_ProfileFailureState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String data) qr,
    required TResult Function(ProfileEntity? profile) profile,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String data)? qr,
    TResult? Function(ProfileEntity? profile)? profile,
    TResult? Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String data)? qr,
    TResult Function(ProfileEntity? profile)? profile,
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
    required TResult Function(_ProfileLoadingState value) loading,
    required TResult Function(_ProfileQrState value) qr,
    required TResult Function(_ProfileState value) profile,
    required TResult Function(_ProfileFailureState value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ProfileLoadingState value)? loading,
    TResult? Function(_ProfileQrState value)? qr,
    TResult? Function(_ProfileState value)? profile,
    TResult? Function(_ProfileFailureState value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ProfileLoadingState value)? loading,
    TResult Function(_ProfileQrState value)? qr,
    TResult Function(_ProfileState value)? profile,
    TResult Function(_ProfileFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _ProfileFailureState implements ProfileState {
  const factory _ProfileFailureState({required final String message}) =
      _$_ProfileFailureState;

  String get message;
  @JsonKey(ignore: true)
  _$$_ProfileFailureStateCopyWith<_$_ProfileFailureState> get copyWith =>
      throw _privateConstructorUsedError;
}
