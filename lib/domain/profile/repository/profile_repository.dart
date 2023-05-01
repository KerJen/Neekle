import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entity/profile_entity.dart';

abstract class ProfileRepository {
  Stream<ProfileEntity?> currentProfile();

  Future<Either<Failure, String>> createQRData();

  Future<Either<Failure, void>> logOut();
}
