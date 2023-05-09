import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../core/error/failure.dart';
import '../../domain/profile/entity/profile_entity.dart';
import '../../domain/profile/repository/profile_repository.dart';
import '../converter/asset_entity_converter.dart';
import '../service/assets_service.dart';
import '../service/auth_service.dart';
import '../service/statistics_service.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl extends ProfileRepository {
  final AuthService authService;
  final AssetsService assetsService;
  final StatisticsService statisticsService;

  final AssetEntityConverter assetEntityConverter;

  ProfileRepositoryImpl({
    required this.authService,
    required this.assetsService,
    required this.statisticsService,
    required this.assetEntityConverter,
  }) {
    authService.walletSessionStatus().listen((session) async {
      final signature = await authService.signSignInMessage(session.accounts.first);

      await authService.logIn(
        address: session.accounts.first,
        message: signature.value1,
        signature: signature.value2,
      );
    });
  }

  @override
  Stream<ProfileEntity?> currentProfile() {
    final authStream = authService.authStateChanges();

    return authStream.flatMap((user) {
      if (user == null) {
        return Stream.value(null);
      }

      return Rx.combineLatest2(
        Stream.fromFuture(statisticsService.getBalance(user.uid)),
        assetsService.showcase(user.uid),
        (balance, showcase) {
          return ProfileEntity(
            address: user.uid,
            balance: balance,
            showcase: showcase.map((model) => assetEntityConverter.convert(model)).toList(growable: false),
          );
        },
      );
    });
  }

  @override
  Future<Either<Failure, String>> createQRData() async {
    try {
      final uri = await authService.createSession();

      return Right(uri);
    } catch (_) {
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, void>> logOut() async {
    try {
      await authService.logOut();

      return const Right(null);
    } catch (_) {
      return Left(UnknownFailure());
    }
  }
}
