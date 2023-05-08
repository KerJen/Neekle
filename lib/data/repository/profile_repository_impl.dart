import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../core/error/failure.dart';
import '../../domain/profile/entity/profile_entity.dart';
import '../../domain/profile/repository/profile_repository.dart';
import '../service/assets_service.dart';
import '../service/auth_service.dart';
import '../service/statistics_service.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl extends ProfileRepository {
  final AuthService authService;
  final AssetsService assetsService;
  final StatisticsService statisticsService;

  ProfileRepositoryImpl({required this.authService, required this.assetsService, required this.statisticsService}) {
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
    // final showcaseStream = assetsService.getAssets(category, lastAssetId: lastAssetId, limit: limit)

    return authStream.flatMap((user) {
      if (user == null) {
        return Stream.value(null);
      }

      // ignore: discarded_futures
      return Stream.fromFuture(statisticsService.getBalance(user.uid)).map(
        (balance) => ProfileEntity(
          address: user.uid,
          balance: balance,
          showcase: const [],
        ),
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
