// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i6;
import 'package:cloud_functions/cloud_functions.dart' as _i7;
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:firebase_core/firebase_core.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:neekle/data/converter/asset_entity_converter.dart' as _i3;
import 'package:neekle/data/module/firebase_module.dart' as _i20;
import 'package:neekle/data/module/web3_module.dart' as _i21;
import 'package:neekle/data/repository/assets_repository_impl.dart' as _i14;
import 'package:neekle/data/repository/profile_repository_impl.dart' as _i16;
import 'package:neekle/data/service/assets_service.dart' as _i10;
import 'package:neekle/data/service/auth_service.dart' as _i11;
import 'package:neekle/data/service/statistics_service.dart' as _i12;
import 'package:neekle/domain/assets/repository/assets_repository.dart' as _i13;
import 'package:neekle/domain/profile/repository/profile_repository.dart'
    as _i15;
import 'package:neekle/view/profile_screen/cubit/cubit.dart' as _i19;
import 'package:neekle/view/shop_screen/assets_list/cubit/cubit.dart' as _i18;
import 'package:neekle/view/studio_screen/cubit/cubit.dart' as _i17;
import 'package:walletconnect_dart/walletconnect_dart.dart' as _i8;
import 'package:web3dart/web3dart.dart' as _i9;

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
    final firebaseModule = _$FirebaseModule();
    final web3Module = _$Web3Module();
    gh.factory<_i3.AssetEntityConverter>(() => _i3.AssetEntityConverter());
    await gh.factoryAsync<_i4.FirebaseApp>(
      () => firebaseModule.firebaseApp,
      preResolve: true,
    );
    gh.factory<_i5.FirebaseAuth>(() => firebaseModule.firebaseAuth);
    gh.factory<_i6.FirebaseFirestore>(() => firebaseModule.firebaseStore);
    gh.factory<_i7.FirebaseFunctions>(() => firebaseModule.functions);
    gh.lazySingleton<_i8.WalletConnect>(() => web3Module.walletConnector);
    gh.lazySingleton<_i9.Web3Client>(() => web3Module.web3client);
    gh.factory<_i10.AssetsService>(
        () => _i10.AssetsServiceImpl(store: gh<_i6.FirebaseFirestore>()));
    gh.lazySingleton<_i11.AuthService>(() => _i11.AuthServiceImpl(
          walletConnector: gh<_i8.WalletConnect>(),
          auth: gh<_i5.FirebaseAuth>(),
          functions: gh<_i7.FirebaseFunctions>(),
        ));
    gh.factory<_i12.StatisticsService>(
        () => _i12.StatisticsServiceImpl(web3client: gh<_i9.Web3Client>()));
    gh.lazySingleton<_i13.AssetsRepository>(() => _i14.AssetsRepositoryImpl(
          assetsService: gh<_i10.AssetsService>(),
          assetEntityConverter: gh<_i3.AssetEntityConverter>(),
        ));
    gh.lazySingleton<_i15.ProfileRepository>(() => _i16.ProfileRepositoryImpl(
          authService: gh<_i11.AuthService>(),
          assetsService: gh<_i10.AssetsService>(),
          statisticsService: gh<_i12.StatisticsService>(),
        ));
    gh.factory<_i17.StudioCubit>(() =>
        _i17.StudioCubit(profileRepository: gh<_i15.ProfileRepository>()));
    gh.factory<_i18.AssetsListCubit>(() =>
        _i18.AssetsListCubit(assetsRepository: gh<_i13.AssetsRepository>()));
    gh.factory<_i19.ProfileCubit>(() =>
        _i19.ProfileCubit(profileRepository: gh<_i15.ProfileRepository>()));
    return this;
  }
}

class _$FirebaseModule extends _i20.FirebaseModule {}

class _$Web3Module extends _i21.Web3Module {}
