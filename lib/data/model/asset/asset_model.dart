import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset_model.freezed.dart';
part 'asset_model.g.dart';

@freezed
class AssetModel with _$AssetModel {
  const factory AssetModel({
    required String id,
    required String coverUrl,
    required String title,
    required String description,
    required double price,
    required List<String> imageUrls,
    required String category,
    required List<String> tags,
    required double? rating,
    required double size,
    required String ext,
  }) = _AssetModel;

  factory AssetModel.fromJson(Map<String, dynamic> json) => _$AssetModelFromJson(json);
}
