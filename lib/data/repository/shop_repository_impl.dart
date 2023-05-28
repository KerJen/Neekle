import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:rxdart/rxdart.dart';
import 'package:web3dart/web3dart.dart';

import '../../core/const.dart';
import '../../core/error/failure.dart';
import '../../domain/assets/entity/asset_entity.dart';
import '../../domain/shop/repository/shop_repository.dart';
import '../converter/asset_entity_converter.dart';
import '../converter/asset_model_converter.dart';
import '../model/asset/asset_model.dart';
import '../service/auth_service.dart';

@LazySingleton(as: ShopRepository)
class ShopRepositoryImpl extends ShopRepository {
  final Isar isar;
  final AuthService authService;

  final DeployedContract contract;

  final AssetEntityConverter assetEntityConverter;
  final AssetModelConverter assetModelConverter;

  ShopRepositoryImpl({
    required this.isar,
    required this.authService,
    required this.contract,
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
              try {
                final model = isar.shopcart.filter().idEqualTo(assetId).findFirstSync();

                if (model == null) {
                  return null;
                }

                return assetEntityConverter.convert(model);
              } catch (_) {
                return null;
              }
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

  @override
  Future<void> clearShopcart() async {
    await isar.writeTxn(() async {
      await isar.clear();
    });
  }

  @override
  Future<Either<Failure, void>> buyAssets() async {
    final currentShopcart = await shopcart().first;

    double totalPrice = 0;
    for (final asset in currentShopcart) {
      totalPrice += asset.price;
    }

    try {
      await authService.sendTransaction(
        Transaction.callContract(
          contract: contract,
          value: EtherAmount.fromBigInt(EtherUnit.wei, BigInt.from(totalPrice * weiInEth)),
          function: contract.function('buyAssets'),
          parameters: [currentShopcart.map((asset) => asset.id).toList(growable: false)],
        ),
      );
      return const Right(null);
    } catch (_) {
      return Left(UnknownFailure());
    }
  }
}
