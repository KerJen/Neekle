import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/profile/repository/profile_repository.dart';

part 'cubit.freezed.dart';
part 'state.dart';

@injectable
class ShopcartBuyButtonCubit extends Cubit<ShopcartBuyButtonState> {
  final ProfileRepository profileRepository;

  StreamSubscription? _subscription;

  ShopcartBuyButtonCubit({
    required this.profileRepository,
  }) : super(const ShopcartBuyButtonState.loading()) {
    _subscription = profileRepository
        .currentProfile()
        .map((event) => ShopcartBuyButtonState.auth(isAuthorized: event != null))
        .listen(emit);
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
