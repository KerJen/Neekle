// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:firebase_core/firebase_core.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:neekle/data/module/firebase_module.dart' as _i9;
import 'package:neekle/data/profile/repository/profile_repository_impl.dart'
    as _i7;
import 'package:neekle/domain/profile/profile_repository.dart' as _i6;
import 'package:neekle/view/profile_screen/cubit/cubit.dart' as _i8;

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
    await gh.factoryAsync<_i3.FirebaseApp>(
      () => firebaseModule.firebaseApp,
      preResolve: true,
    );
    gh.factory<_i4.FirebaseAuth>(() => firebaseModule.firebaseAuth);
    gh.factory<_i5.FirebaseFirestore>(() => firebaseModule.firebaseStore);
    gh.singleton<_i6.ProfileRepository>(_i7.ProfileRepositoryImpl());
    gh.factory<_i8.ProfileCubit>(
        () => _i8.ProfileCubit(profileRepository: gh<_i6.ProfileRepository>()));
    return this;
  }
}

class _$FirebaseModule extends _i9.FirebaseModule {}
