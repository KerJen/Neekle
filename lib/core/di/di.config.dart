// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i8;
import 'package:cloud_functions/cloud_functions.dart' as _i9;
import 'package:firebase_auth/firebase_auth.dart' as _i7;
import 'package:firebase_core/firebase_core.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i10;
import 'package:neekle/data/converter/asset_entity_converter.dart' as _i3;
import 'package:neekle/data/converter/asset_model_converter.dart' as _i4;
import 'package:neekle/data/module/database_module.dart' as _i31;
import 'package:neekle/data/module/firebase_module.dart' as _i30;
import 'package:neekle/data/module/web3_module.dart' as _i32;
import 'package:neekle/data/repository/assets_repository_impl.dart' as _i19;
import 'package:neekle/data/repository/profile_repository_impl.dart' as _i21;
import 'package:neekle/data/repository/shop_repository_impl.dart' as _i12;
import 'package:neekle/data/service/assets_service.dart' as _i15;
import 'package:neekle/data/service/auth_service.dart' as _i16;
import 'package:neekle/data/service/statistics_service.dart' as _i17;
import 'package:neekle/domain/assets/repository/assets_repository.dart' as _i18;
import 'package:neekle/domain/profile/repository/profile_repository.dart'
    as _i20;
import 'package:neekle/domain/shop/repository/shop_repository.dart' as _i11;
import 'package:neekle/view/asset_screen/cubit/cubit.dart' as _i27;
import 'package:neekle/view/profile_screen/cubit/cubit.dart' as _i29;
import 'package:neekle/view/qr_sheet/cubit/cubit.dart' as _i22;
import 'package:neekle/view/shop_screen/assets_list/cubit/cubit.dart' as _i28;
import 'package:neekle/view/shop_screen/cubit/cubit.dart' as _i24;
import 'package:neekle/view/shop_screen/shopcart_sheet/buy_button/cubit/cubit.dart'
    as _i25;
import 'package:neekle/view/shop_screen/shopcart_sheet/cubit/cubit.dart'
    as _i13;
import 'package:neekle/view/studio_screen/cubit/cubit.dart' as _i26;
import 'package:neekle/view/studio_screen/set_asset_sheet/cubit/cubit.dart'
    as _i23;
import 'package:walletconnect_dart/walletconnect_dart.dart' as _i14;
import 'package:web3dart/web3dart.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final web3Module = _$Web3Module();
    final firebaseModule = _$FirebaseModule();
    final databaseModule = _$DatabaseModule();
    gh.factory<_i3.AssetEntityConverter>(() => _i3.AssetEntityConverter());
    gh.factory<_i4.AssetModelConverter>(() => _i4.AssetModelConverter());
    await gh.factoryAsync<_i5.DeployedContract>(
      () => web3Module.contract,
      preResolve: true,
    );
    await gh.factoryAsync<_i6.FirebaseApp>(
      () => firebaseModule.firebaseApp,
      preResolve: true,
    );
    gh.factory<_i7.FirebaseAuth>(() => firebaseModule.firebaseAuth);
    gh.factory<_i8.FirebaseFirestore>(() => firebaseModule.firebaseStore);
    gh.factory<_i9.FirebaseFunctions>(() => firebaseModule.functions);
    await gh.factoryAsync<_i10.Isar>(
      () => databaseModule.isar,
      preResolve: true,
    );
    gh.lazySingleton<_i11.ShopRepository>(() => _i12.ShopRepositoryImpl(
          isar: gh<_i10.Isar>(),
          assetEntityConverter: gh<_i3.AssetEntityConverter>(),
          assetModelConverter: gh<_i4.AssetModelConverter>(),
        ));
    gh.factory<_i13.ShopcartCubit>(
        () => _i13.ShopcartCubit(shopRepository: gh<_i11.ShopRepository>()));
    gh.lazySingleton<_i14.WalletConnect>(() => web3Module.walletConnector);
    gh.lazySingleton<_i5.Web3Client>(() => web3Module.web3client);
    gh.lazySingleton<_i15.AssetsService>(() => _i15.AssetsServiceImpl(
          store: gh<_i8.FirebaseFirestore>(),
          web3: gh<_i5.Web3Client>(),
          contract: gh<_i5.DeployedContract>(),
        ));
    gh.lazySingleton<_i16.AuthService>(() => _i16.AuthServiceImpl(
          walletConnector: gh<_i14.WalletConnect>(),
          auth: gh<_i7.FirebaseAuth>(),
          functions: gh<_i9.FirebaseFunctions>(),
        ));
    gh.factory<_i17.StatisticsService>(
        () => _i17.StatisticsServiceImpl(web3client: gh<_i5.Web3Client>()));
    gh.lazySingleton<_i18.AssetsRepository>(() => _i19.AssetsRepositoryImpl(
          authService: gh<_i16.AuthService>(),
          assetsService: gh<_i15.AssetsService>(),
          assetModelConverter: gh<_i4.AssetModelConverter>(),
          assetEntityConverter: gh<_i3.AssetEntityConverter>(),
        ));
    gh.lazySingleton<_i20.ProfileRepository>(() => _i21.ProfileRepositoryImpl(
          authService: gh<_i16.AuthService>(),
          assetsService: gh<_i15.AssetsService>(),
          statisticsService: gh<_i17.StatisticsService>(),
          assetEntityConverter: gh<_i3.AssetEntityConverter>(),
        ));
    gh.factory<_i22.QrCubit>(
        () => _i22.QrCubit(profileRepository: gh<_i20.ProfileRepository>()));
    gh.factory<_i23.SetAssetCubit>(() =>
        _i23.SetAssetCubit(assetsRepository: gh<_i18.AssetsRepository>()));
    gh.factory<_i24.ShopCubit>(
        () => _i24.ShopCubit(profileRepository: gh<_i20.ProfileRepository>()));
    gh.factory<_i25.ShopcartBuyButtonCubit>(() => _i25.ShopcartBuyButtonCubit(
        profileRepository: gh<_i20.ProfileRepository>()));
    gh.factory<_i26.StudioCubit>(() =>
        _i26.StudioCubit(profileRepository: gh<_i20.ProfileRepository>()));
    gh.factoryParam<_i27.AssetCubit, String, dynamic>((
      assetId,
      _,
    ) =>
        _i27.AssetCubit(
          assetId: assetId,
          assetsRepository: gh<_i18.AssetsRepository>(),
          shopRepository: gh<_i11.ShopRepository>(),
        ));
    gh.factoryParam<_i28.AssetsListCubit, String?, dynamic>((
      category,
      _,
    ) =>
        _i28.AssetsListCubit(
          category: category,
          assetsRepository: gh<_i18.AssetsRepository>(),
          shopRepository: gh<_i11.ShopRepository>(),
        ));
    gh.factory<_i29.ProfileCubit>(() =>
        _i29.ProfileCubit(profileRepository: gh<_i20.ProfileRepository>()));
    return this;
  }
}

class _$FirebaseModule extends _i30.FirebaseModule {}

class _$DatabaseModule extends _i31.DatabaseModule {}

class _$Web3Module extends _i32.Web3Module {}
