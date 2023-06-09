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
import 'package:firebase_storage/firebase_storage.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i11;
import 'package:neekle/data/converter/asset_entity_converter.dart' as _i3;
import 'package:neekle/data/converter/asset_model_converter.dart' as _i4;
import 'package:neekle/data/module/database_module.dart' as _i34;
import 'package:neekle/data/module/firebase_module.dart' as _i33;
import 'package:neekle/data/module/web3_module.dart' as _i35;
import 'package:neekle/data/repository/assets_repository_impl.dart' as _i21;
import 'package:neekle/data/repository/profile_repository_impl.dart' as _i23;
import 'package:neekle/data/repository/shop_repository_impl.dart' as _i17;
import 'package:neekle/data/service/assets_service.dart' as _i13;
import 'package:neekle/data/service/auth_service.dart' as _i14;
import 'package:neekle/data/service/file_service.dart' as _i15;
import 'package:neekle/data/service/statistics_service.dart' as _i19;
import 'package:neekle/domain/assets/repository/assets_repository.dart' as _i20;
import 'package:neekle/domain/profile/repository/profile_repository.dart'
    as _i22;
import 'package:neekle/domain/shop/repository/shop_repository.dart' as _i16;
import 'package:neekle/view/asset_screen/cubit/cubit.dart' as _i30;
import 'package:neekle/view/profile_screen/cubit/cubit.dart' as _i32;
import 'package:neekle/view/profile_screen/purchased_assets_sheet/cubit/cubit.dart'
    as _i24;
import 'package:neekle/view/qr_sheet/cubit/cubit.dart' as _i25;
import 'package:neekle/view/shop_screen/assets_list/cubit/cubit.dart' as _i31;
import 'package:neekle/view/shop_screen/cubit/cubit.dart' as _i27;
import 'package:neekle/view/shop_screen/shopcart_sheet/buy_button/cubit/cubit.dart'
    as _i28;
import 'package:neekle/view/shop_screen/shopcart_sheet/cubit/cubit.dart'
    as _i18;
import 'package:neekle/view/studio_screen/cubit/cubit.dart' as _i29;
import 'package:neekle/view/studio_screen/set_asset_sheet/cubit/cubit.dart'
    as _i26;
import 'package:walletconnect_dart/walletconnect_dart.dart' as _i12;
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
    await gh.lazySingletonAsync<_i5.DeployedContract>(
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
    gh.factory<_i10.FirebaseStorage>(() => firebaseModule.storage);
    await gh.factoryAsync<_i11.Isar>(
      () => databaseModule.isar,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i12.WalletConnect>(
      () => web3Module.walletConnector,
      preResolve: true,
    );
    gh.lazySingleton<_i5.Web3Client>(() => web3Module.web3client);
    gh.lazySingleton<_i13.AssetsService>(() => _i13.AssetsServiceImpl(
          store: gh<_i8.FirebaseFirestore>(),
          web3: gh<_i5.Web3Client>(),
          contract: gh<_i5.DeployedContract>(),
        ));
    gh.lazySingleton<_i14.AuthService>(() => _i14.AuthServiceImpl(
          walletConnector: gh<_i12.WalletConnect>(),
          web3Client: gh<_i5.Web3Client>(),
          auth: gh<_i7.FirebaseAuth>(),
          functions: gh<_i9.FirebaseFunctions>(),
        ));
    gh.lazySingleton<_i15.FilesService>(
        () => _i15.FilesServiceImpl(storage: gh<_i10.FirebaseStorage>()));
    gh.lazySingleton<_i16.ShopRepository>(() => _i17.ShopRepositoryImpl(
          isar: gh<_i11.Isar>(),
          authService: gh<_i14.AuthService>(),
          contract: gh<_i5.DeployedContract>(),
          assetEntityConverter: gh<_i3.AssetEntityConverter>(),
          assetModelConverter: gh<_i4.AssetModelConverter>(),
        ));
    gh.factory<_i18.ShopcartCubit>(
        () => _i18.ShopcartCubit(shopRepository: gh<_i16.ShopRepository>()));
    gh.factory<_i19.StatisticsService>(
        () => _i19.StatisticsServiceImpl(web3client: gh<_i5.Web3Client>()));
    gh.lazySingleton<_i20.AssetsRepository>(() => _i21.AssetsRepositoryImpl(
          authService: gh<_i14.AuthService>(),
          assetsService: gh<_i13.AssetsService>(),
          filesService: gh<_i15.FilesService>(),
          contract: gh<_i5.DeployedContract>(),
          assetModelConverter: gh<_i4.AssetModelConverter>(),
          assetEntityConverter: gh<_i3.AssetEntityConverter>(),
        ));
    gh.lazySingleton<_i22.ProfileRepository>(() => _i23.ProfileRepositoryImpl(
          authService: gh<_i14.AuthService>(),
          assetsService: gh<_i13.AssetsService>(),
          statisticsService: gh<_i19.StatisticsService>(),
          assetEntityConverter: gh<_i3.AssetEntityConverter>(),
        ));
    gh.factory<_i24.PurchasedAssetsCubit>(() => _i24.PurchasedAssetsCubit(
          profileRepository: gh<_i22.ProfileRepository>(),
          assetsRepository: gh<_i20.AssetsRepository>(),
        ));
    gh.factory<_i25.QrCubit>(
        () => _i25.QrCubit(profileRepository: gh<_i22.ProfileRepository>()));
    gh.factory<_i26.SetAssetCubit>(() =>
        _i26.SetAssetCubit(assetsRepository: gh<_i20.AssetsRepository>()));
    gh.factory<_i27.ShopCubit>(
        () => _i27.ShopCubit(profileRepository: gh<_i22.ProfileRepository>()));
    gh.factory<_i28.ShopcartBuyButtonCubit>(() => _i28.ShopcartBuyButtonCubit(
          profileRepository: gh<_i22.ProfileRepository>(),
          shopRepository: gh<_i16.ShopRepository>(),
        ));
    gh.factory<_i29.StudioCubit>(() =>
        _i29.StudioCubit(profileRepository: gh<_i22.ProfileRepository>()));
    gh.factoryParam<_i30.AssetCubit, String, dynamic>((
      assetId,
      _,
    ) =>
        _i30.AssetCubit(
          assetId: assetId,
          assetsRepository: gh<_i20.AssetsRepository>(),
          shopRepository: gh<_i16.ShopRepository>(),
        ));
    gh.factoryParam<_i31.AssetsListCubit, String?, dynamic>((
      category,
      _,
    ) =>
        _i31.AssetsListCubit(
          category: category,
          assetsRepository: gh<_i20.AssetsRepository>(),
          shopRepository: gh<_i16.ShopRepository>(),
        ));
    gh.factory<_i32.ProfileCubit>(() =>
        _i32.ProfileCubit(profileRepository: gh<_i22.ProfileRepository>()));
    return this;
  }
}

class _$FirebaseModule extends _i33.FirebaseModule {}

class _$DatabaseModule extends _i34.DatabaseModule {}

class _$Web3Module extends _i35.Web3Module {}
