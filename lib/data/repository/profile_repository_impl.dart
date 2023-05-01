import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/failure.dart';
import '../../domain/profile/entity/profile_entity.dart';
import '../../domain/profile/repository/profile_repository.dart';
import '../service/auth_service.dart';
import '../service/web3_service.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl extends ProfileRepository {
  final AuthService authService;
  final Web3Service web3service;

  ProfileRepositoryImpl({required this.authService, required this.web3service}) {
    authService.walletSessionStatus().listen((session) async {
      final message =
          'Sign in with your Ethereum wallet to authenticate with Neekle. Nonce: ${Random().nextInt(100000)}';

      final signature = await web3service.signMessage(message, session.accounts.first);

      await authService.logIn(
        address: session.accounts.first,
        message: signature.value1,
        signature: signature.value2,
      );
    });
  }

  @override
  Stream<ProfileEntity?> currentProfile() {
    return authService.authStateChanges().asyncMap((user) async {
      ProfileEntity? profile;

      if (user != null) {
        final balance = await web3service.getBalance(user.uid);
        profile = ProfileEntity(address: user.uid, balance: balance);
      }

      return profile;
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
