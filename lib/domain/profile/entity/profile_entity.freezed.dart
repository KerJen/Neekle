// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProfileEntity {
  String get address => throw _privateConstructorUsedError;
  double get balance => throw _privateConstructorUsedError;
  List<AssetEntity> get showcase => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileEntityCopyWith<ProfileEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileEntityCopyWith<$Res> {
  factory $ProfileEntityCopyWith(
          ProfileEntity value, $Res Function(ProfileEntity) then) =
      _$ProfileEntityCopyWithImpl<$Res, ProfileEntity>;
  @useResult
  $Res call({String address, double balance, List<AssetEntity> showcase});
}

/// @nodoc
class _$ProfileEntityCopyWithImpl<$Res, $Val extends ProfileEntity>
    implements $ProfileEntityCopyWith<$Res> {
  _$ProfileEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? balance = null,
    Object? showcase = null,
  }) {
    return _then(_value.copyWith(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      showcase: null == showcase
          ? _value.showcase
          : showcase // ignore: cast_nullable_to_non_nullable
              as List<AssetEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProfileEntityCopyWith<$Res>
    implements $ProfileEntityCopyWith<$Res> {
  factory _$$_ProfileEntityCopyWith(
          _$_ProfileEntity value, $Res Function(_$_ProfileEntity) then) =
      __$$_ProfileEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String address, double balance, List<AssetEntity> showcase});
}

/// @nodoc
class __$$_ProfileEntityCopyWithImpl<$Res>
    extends _$ProfileEntityCopyWithImpl<$Res, _$_ProfileEntity>
    implements _$$_ProfileEntityCopyWith<$Res> {
  __$$_ProfileEntityCopyWithImpl(
      _$_ProfileEntity _value, $Res Function(_$_ProfileEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? balance = null,
    Object? showcase = null,
  }) {
    return _then(_$_ProfileEntity(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      showcase: null == showcase
          ? _value._showcase
          : showcase // ignore: cast_nullable_to_non_nullable
              as List<AssetEntity>,
    ));
  }
}

/// @nodoc

class _$_ProfileEntity implements _ProfileEntity {
  const _$_ProfileEntity(
      {required this.address,
      required this.balance,
      required final List<AssetEntity> showcase})
      : _showcase = showcase;

  @override
  final String address;
  @override
  final double balance;
  final List<AssetEntity> _showcase;
  @override
  List<AssetEntity> get showcase {
    if (_showcase is EqualUnmodifiableListView) return _showcase;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_showcase);
  }

  @override
  String toString() {
    return 'ProfileEntity(address: $address, balance: $balance, showcase: $showcase)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfileEntity &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            const DeepCollectionEquality().equals(other._showcase, _showcase));
  }

  @override
  int get hashCode => Object.hash(runtimeType, address, balance,
      const DeepCollectionEquality().hash(_showcase));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileEntityCopyWith<_$_ProfileEntity> get copyWith =>
      __$$_ProfileEntityCopyWithImpl<_$_ProfileEntity>(this, _$identity);
}

abstract class _ProfileEntity implements ProfileEntity {
  const factory _ProfileEntity(
      {required final String address,
      required final double balance,
      required final List<AssetEntity> showcase}) = _$_ProfileEntity;

  @override
  String get address;
  @override
  double get balance;
  @override
  List<AssetEntity> get showcase;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileEntityCopyWith<_$_ProfileEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
