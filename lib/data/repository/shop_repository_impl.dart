import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:rxdart/rxdart.dart';

import '../../domain/assets/entity/asset_entity.dart';
import '../../domain/shop/repository/shop_repository.dart';
import '../converter/asset_entity_converter.dart';
import '../converter/asset_model_converter.dart';
import '../model/asset/asset_model.dart';

@LazySingleton(as: ShopRepository)
class ShopRepositoryImpl extends ShopRepository {
  final Isar isar;
  final AssetEntityConverter assetEntityConverter;
  final AssetModelConverter assetModelConverter;

  ShopRepositoryImpl({
    required this.isar,
    required this.assetEntityConverter,
    required this.assetModelConverter,
  });

  @override
  Stream<List<AssetEntity>> shopcart() {
    return isar.shopcart.watchLazy().startWith(null).map(
          (event) => isar.txnSync(
            () {
              return isar.shopcart.where().findAllSync().map((e) => assetEntityConverter.convert(e)).toList();
            },
          ),
        );
  }

  @override
  Stream<AssetEntity?> shopcartAsset(String assetId) {
    return isar.shopcart.watchLazy().startWith(null).map(
          (event) => isar.txnSync(
            () {
              final model = isar.shopcart.filter().idEqualTo(assetId).findFirstSync();

              if (model == null) {
                return null;
              }

              return assetEntityConverter.convert(model);
            },
          ),
        );
  }

  @override
  Future<void> addAssetToShopcart(AssetEntity asset) async {
    await isar.writeTxn(() async {
      await isar.shopcart.put(assetModelConverter.convert(asset));
    });
  }

  @override
  Future<void> removeAssetFromShopcart(String assetId) async {
    await isar.writeTxn(() async {
      await isar.shopcart.filter().idEqualTo(assetId).deleteFirst();
    });
  }
}
