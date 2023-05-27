import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'asset_model.freezed.dart';
part 'asset_model.g.dart';

@freezed
@Collection(accessor: 'shopcart', ignore: {'copyWith'})
class AssetModel with _$AssetModel {
  const AssetModel._();

  const factory AssetModel({
    @JsonKey(includeToJson: false) required String id,
    required String coverUrl,
    required String title,
    required String description,
    required double price,
    required List<String> imageUrls,
    required String category,
    required List<String> tags,
    required double? rating,
  }) = _AssetModel;

  Id get isarId => Isar.autoIncrement;

  factory AssetModel.fromJson(Map<String, dynamic> json) => _$AssetModelFromJson(json);
}
