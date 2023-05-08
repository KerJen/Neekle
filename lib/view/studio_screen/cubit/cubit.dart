import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/assets/entity/asset_entity.dart';
import '../../../domain/profile/repository/profile_repository.dart';

part 'cubit.freezed.dart';
part 'state.dart';

@injectable
class StudioCubit extends Cubit<StudioState> {
  final ProfileRepository profileRepository;

  StreamSubscription? profileSubscription;

  StudioCubit({required this.profileRepository}) : super(const StudioState.loading()) {
    profileSubscription = profileRepository.currentProfile().map((profile) {
      if (profile == null) {
        return const StudioState.needLogIn();
      }

      return StudioState.studio(showcase: profile.showcase);
    }).listen(emit);
  }

  @override
  Future<void> close() async {
    await profileSubscription?.cancel();
    return super.close();
  }
}
