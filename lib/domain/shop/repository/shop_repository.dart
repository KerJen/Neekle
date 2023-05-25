import 'package:isar/isar.dart';

import '../../assets/entity/asset_entity.dart';

abstract class ShopRepository {
  Stream<List<AssetEntity>> getShopcart();
  Future<void> addAssetToShopcart(AssetEntity asset);
  Future<void> removeAssetFromShopcart(Id isarId);
}
