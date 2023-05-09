import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/profile/repository/profile_repository.dart';

part 'cubit.freezed.dart';
part 'state.dart';

@injectable
class ShopCubit extends Cubit<ShopState> {
  final ProfileRepository profileRepository;

  StreamSubscription? profileSubscription;

  ShopCubit({
    required this.profileRepository,
  }) : super(const ShopState.loading()) {
    profileSubscription = profileRepository
        .currentProfile()
        .asyncMap((event) => ShopState.shop(isAuthorized: event != null))
        .listen(emit);
  }

  @override
  Future<void> close() async {
    await profileSubscription?.cancel();
    return super.close();
  }
}
