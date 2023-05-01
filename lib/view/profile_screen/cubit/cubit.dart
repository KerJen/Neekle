import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/profile/entity/profile_entity.dart';
import '../../../domain/profile/repository/profile_repository.dart';

part 'cubit.freezed.dart';
part 'state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository profileRepository;

  StreamSubscription? _profileSubscription;

  ProfileCubit({
    required this.profileRepository,
  }) : super(const ProfileState.loading()) {
    _profileSubscription =
        profileRepository.currentProfile().map((event) => ProfileState.profile(profile: event)).listen(emit);
  }

  void createQR() async {
    emit(const ProfileState.loading());

    final qrDataEither = await profileRepository.createQRData();

    emit(
      qrDataEither.fold(
        (failure) => const ProfileState.failure(message: ''),
        (data) => ProfileState.qr(data: data),
      ),
    );
  }

  void logOut() async {
    await profileRepository.logOut();
  }

  @override
  Future<void> close() async {
    await _profileSubscription?.cancel();
    return super.close();
  }
}
