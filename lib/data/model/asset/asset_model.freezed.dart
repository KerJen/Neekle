// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asset_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AssetModel _$AssetModelFromJson(Map<String, dynamic> json) {
  return _AssetModel.fromJson(json);
}

/// @nodoc
mixin _$AssetModel {
  @JsonKey(includeToJson: false)
  String get id => throw _privateConstructorUsedError;
  String get coverUrl => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  List<String> get imageUrls => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  double? get rating => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssetModelCopyWith<AssetModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetModelCopyWith<$Res> {
  factory $AssetModelCopyWith(
          AssetModel value, $Res Function(AssetModel) then) =
      _$AssetModelCopyWithImpl<$Res, AssetModel>;
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) String id,
      String coverUrl,
      String title,
      String description,
      double price,
      List<String> imageUrls,
      String category,
      List<String> tags,
      double? rating});
}

/// @nodoc
class _$AssetModelCopyWithImpl<$Res, $Val extends AssetModel>
    implements $AssetModelCopyWith<$Res> {
  _$AssetModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? coverUrl = null,
    Object? title = null,
    Object? description = null,
    Object? price = null,
    Object? imageUrls = null,
    Object? category = null,
    Object? tags = null,
    Object? rating = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      coverUrl: null == coverUrl
          ? _value.coverUrl
          : coverUrl // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      imageUrls: null == imageUrls
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AssetModelCopyWith<$Res>
    implements $AssetModelCopyWith<$Res> {
  factory _$$_AssetModelCopyWith(
          _$_AssetModel value, $Res Function(_$_AssetModel) then) =
      __$$_AssetModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) String id,
      String coverUrl,
      String title,
      String description,
      double price,
      List<String> imageUrls,
      String category,
      List<String> tags,
      double? rating});
}

/// @nodoc
class __$$_AssetModelCopyWithImpl<$Res>
    extends _$AssetModelCopyWithImpl<$Res, _$_AssetModel>
    implements _$$_AssetModelCopyWith<$Res> {
  __$$_AssetModelCopyWithImpl(
      _$_AssetModel _value, $Res Function(_$_AssetModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? coverUrl = null,
    Object? title = null,
    Object? description = null,
    Object? price = null,
    Object? imageUrls = null,
    Object? category = null,
    Object? tags = null,
    Object? rating = freezed,
  }) {
    return _then(_$_AssetModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      coverUrl: null == coverUrl
          ? _value.coverUrl
          : coverUrl // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      imageUrls: null == imageUrls
          ? _value._imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AssetModel extends _AssetModel {
  const _$_AssetModel(
      {@JsonKey(includeToJson: false) required this.id,
      required this.coverUrl,
      required this.title,
      required this.description,
      required this.price,
      required final List<String> imageUrls,
      required this.category,
      required final List<String> tags,
      required this.rating})
      : _imageUrls = imageUrls,
        _tags = tags,
        super._();

  factory _$_AssetModel.fromJson(Map<String, dynamic> json) =>
      _$$_AssetModelFromJson(json);

  @override
  @JsonKey(includeToJson: false)
  final String id;
  @override
  final String coverUrl;
  @override
  final String title;
  @override
  final String description;
  @override
  final double price;
  final List<String> _imageUrls;
  @override
  List<String> get imageUrls {
    if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageUrls);
  }

  @override
  final String category;
  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final double? rating;

  @override
  String toString() {
    return 'AssetModel(id: $id, coverUrl: $coverUrl, title: $title, description: $description, price: $price, imageUrls: $imageUrls, category: $category, tags: $tags, rating: $rating)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AssetModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.coverUrl, coverUrl) ||
                other.coverUrl == coverUrl) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            const DeepCollectionEquality()
                .equals(other._imageUrls, _imageUrls) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      coverUrl,
      title,
      description,
      price,
      const DeepCollectionEquality().hash(_imageUrls),
      category,
      const DeepCollectionEquality().hash(_tags),
      rating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AssetModelCopyWith<_$_AssetModel> get copyWith =>
      __$$_AssetModelCopyWithImpl<_$_AssetModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AssetModelToJson(
      this,
    );
  }
}

abstract class _AssetModel extends AssetModel {
  const factory _AssetModel(
      {@JsonKey(includeToJson: false) required final String id,
      required final String coverUrl,
      required final String title,
      required final String description,
      required final double price,
      required final List<String> imageUrls,
      required final String category,
      required final List<String> tags,
      required final double? rating}) = _$_AssetModel;
  const _AssetModel._() : super._();

  factory _AssetModel.fromJson(Map<String, dynamic> json) =
      _$_AssetModel.fromJson;

  @override
  @JsonKey(includeToJson: false)
  String get id;
  @override
  String get coverUrl;
  @override
  String get title;
  @override
  String get description;
  @override
  double get price;
  @override
  List<String> get imageUrls;
  @override
  String get category;
  @override
  List<String> get tags;
  @override
  double? get rating;
  @override
  @JsonKey(ignore: true)
  _$$_AssetModelCopyWith<_$_AssetModel> get copyWith =>
      throw _privateConstructorUsedError;
}
