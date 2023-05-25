import 'dart:convert';

import 'package:injectable/injectable.dart';

import '../../domain/assets/entity/asset_entity.dart';
import '../model/asset/asset_model.dart';

@injectable
class AssetModelConverter extends Converter<AssetEntity, AssetModel> {
  @override
  AssetModel convert(AssetEntity input) {
    return AssetModel(
      id: input.id,
      coverUrl: input.coverUrl,
      title: input.title,
      description: input.description,
      price: input.price,
      imageUrls: input.imageUrls,
      category: input.category,
      tags: input.tags,
      rating: input.rating,
      size: input.size,
      ext: input.ext,
    );
  }
}
