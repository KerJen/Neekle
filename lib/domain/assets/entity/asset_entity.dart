import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset_entity.freezed.dart';

@freezed
class AssetEntity with _$AssetEntity {
  const factory AssetEntity({
    required String id,
    required String coverUrl,
    required String title,
    required String description,
    required double price,
    required List<String> imageUrls,
    required String category,
    required List<String> tags,
    required double? rating,
  }) = _AssetEntity;

  factory AssetEntity.empty() => const AssetEntity(
        id: '',
        coverUrl: '',
        title: '',
        description: '_descriptionController.text',
        price: 0,
        imageUrls: [],
        category: '',
        tags: [],
        rating: null,
      );
}
