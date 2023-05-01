import 'package:injectable/injectable.dart';

import '../../../domain/profile/profile_repository.dart';

@Singleton(as: ProfileRepository)
class ProfileRepositoryImpl extends ProfileRepository {}
