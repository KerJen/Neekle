// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AssetModel _$$_AssetModelFromJson(Map<String, dynamic> json) =>
    _$_AssetModel(
      id: json['id'] as String,
      coverUrl: json['coverUrl'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      imageUrls:
          (json['imageUrls'] as List<dynamic>).map((e) => e as String).toList(),
      category: json['category'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      rating: (json['rating'] as num?)?.toDouble(),
      size: (json['size'] as num).toDouble(),
      ext: json['ext'] as String,
    );

Map<String, dynamic> _$$_AssetModelToJson(_$_AssetModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'coverUrl': instance.coverUrl,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'imageUrls': instance.imageUrls,
      'category': instance.category,
      'tags': instance.tags,
      'rating': instance.rating,
      'size': instance.size,
      'ext': instance.ext,
    };
