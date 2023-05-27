import 'dart:convert';

import 'package:injectable/injectable.dart';

import '../../domain/assets/entity/asset_entity.dart';
import '../model/asset/asset_model.dart';

@injectable
class AssetEntityConverter extends Converter<AssetModel, AssetEntity> {
  @override
  AssetEntity convert(AssetModel input) {
    return AssetEntity(
      id: input.id,
      coverUrl: input.coverUrl,
      title: input.title,
      description: input.description,
      price: input.price,
      imageUrls: input.imageUrls,
      category: input.category,
      tags: input.tags,
      rating: input.rating,
    );
  }
}
