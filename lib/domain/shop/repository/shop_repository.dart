import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../assets/entity/asset_entity.dart';

abstract class ShopRepository {
  Stream<List<AssetEntity>> shopcart();
  Stream<AssetEntity?> shopcartAsset(String assetId);
  Future<void> addAssetToShopcart(AssetEntity asset);
  Future<void> removeAssetFromShopcart(String assetId);
  Future<void> clearShopcart();
  Future<Either<Failure, void>> buyAssets();
}
