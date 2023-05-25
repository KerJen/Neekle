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
  Stream<List<AssetEntity>> getShopcart() {
    return isar.shopcart.watchLazy().startWith(null).asyncMap(
          (event) async => await isar.txn(
            () async {
              return (await isar.shopcart.where().findAll()).map((e) => assetEntityConverter.convert(e)).toList();
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
