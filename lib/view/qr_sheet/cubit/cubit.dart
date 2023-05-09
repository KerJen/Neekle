import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/profile/repository/profile_repository.dart';

part 'cubit.freezed.dart';
part 'state.dart';

@injectable
class QrCubit extends Cubit<QrState> {
  final ProfileRepository profileRepository;

  StreamSubscription? _profileSubscription;

  QrCubit({required this.profileRepository}) : super(const QrState.loading()) {
    createQR();

    _profileSubscription = profileRepository.currentProfile().listen((event) {
      if (event != null) {
        emit(const QrState.auth());
      }
    });
  }

  void createQR() async {
    final qrDataEither = await profileRepository.createQRData();

    emit(
      qrDataEither.fold(
        (failure) => const QrState.failure(message: ''),
        (data) => QrState.qr(data: data),
      ),
    );
  }

  @override
  Future<void> close() async {
    await _profileSubscription?.cancel();
    return super.close();
  }
}
