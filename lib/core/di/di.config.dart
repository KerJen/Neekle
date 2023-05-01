// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:cloud_functions/cloud_functions.dart' as _i6;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:firebase_core/firebase_core.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:neekle/data/module/firebase_module.dart' as _i14;
import 'package:neekle/data/module/web3_module.dart' as _i15;
import 'package:neekle/data/repository/profile_repository_impl.dart' as _i12;
import 'package:neekle/data/service/auth_service.dart' as _i10;
import 'package:neekle/data/service/web3_service.dart' as _i9;
import 'package:neekle/domain/profile/repository/profile_repository.dart'
    as _i11;
import 'package:neekle/view/profile_screen/cubit/cubit.dart' as _i13;
import 'package:walletconnect_dart/walletconnect_dart.dart' as _i7;
import 'package:web3dart/web3dart.dart' as _i8;

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
    await gh.factoryAsync<_i3.FirebaseApp>(
      () => firebaseModule.firebaseApp,
      preResolve: true,
    );
    gh.factory<_i4.FirebaseAuth>(() => firebaseModule.firebaseAuth);
    gh.factory<_i5.FirebaseFirestore>(() => firebaseModule.firebaseStore);
    gh.factory<_i6.FirebaseFunctions>(() => firebaseModule.functions);
    gh.lazySingleton<_i7.WalletConnect>(() => web3Module.walletConnector);
    gh.lazySingleton<_i8.Web3Client>(() => web3Module.web3client);
    gh.factory<_i9.Web3Service>(() => _i9.Web3ServiceImpl(
          walletConnector: gh<_i7.WalletConnect>(),
          web3client: gh<_i8.Web3Client>(),
        ));
    gh.lazySingleton<_i10.AuthService>(() => _i10.AuthServiceImpl(
          walletConnector: gh<_i7.WalletConnect>(),
          auth: gh<_i4.FirebaseAuth>(),
          functions: gh<_i6.FirebaseFunctions>(),
        ));
    gh.lazySingleton<_i11.ProfileRepository>(() => _i12.ProfileRepositoryImpl(
          authService: gh<_i10.AuthService>(),
          web3service: gh<_i9.Web3Service>(),
        ));
    gh.factory<_i13.ProfileCubit>(() =>
        _i13.ProfileCubit(profileRepository: gh<_i11.ProfileRepository>()));
    return this;
  }
}

class _$FirebaseModule extends _i14.FirebaseModule {}

class _$Web3Module extends _i15.Web3Module {}
