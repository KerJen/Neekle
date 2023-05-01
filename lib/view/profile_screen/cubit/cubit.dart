import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/profile/profile_repository.dart';

part 'cubit.freezed.dart';
part 'state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository profileRepository;

  ProfileCubit({
    required this.profileRepository,
  }) : super(const ProfileState.loading());
}
