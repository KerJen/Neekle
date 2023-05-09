import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../core/di/di.dart';
import '../../../core/helper/sheet_helper.dart';
import '../../../core/ui/colors.dart';
import '../../../core/ui/kit/loading_indicator.dart';
import '../../../core/ui/text_styles.dart';
import 'cubit/cubit.dart';

class QrSheet extends StatefulWidget {
  const QrSheet({
    super.key,
  });

  static Future<void> show(BuildContext context) async {
    return BottomSheetHelper.show(
      context,
      (context, padding) => const QrSheet(),
      isScrollControlled: true,
    );
  }

  @override
  State<QrSheet> createState() => _QrSheetState();
}

class _QrSheetState extends State<QrSheet> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<QrCubit>(),
      child: BlocConsumer<QrCubit, QrState>(
        listener: (context, state) {
          state.mapOrNull(
            auth: (value) {
              Navigator.pop(context);
            },
          );
        },
        buildWhen: (previous, current) =>
            current.mapOrNull(
              loading: (value) => true,
              qr: (value) => true,
            ) ??
            false,
        builder: (context, state) {
          return Container(
            color: currentColorScheme(context).background,
            child: Column(
              children: [
                const SizedBox(height: 16),
                state.maybeMap(
                  qr: (value) {
                    return QrImage(
                      data: value.data,
                      foregroundColor: currentColorScheme(context).onBackground,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                    );
                  },
                  orElse: () {
                    final size = MediaQuery.of(context).size.width;
                    return SizedBox(
                      height: size,
                      width: size,
                      child: const LoadingIndicator(),
                    );
                  },
                ),
                const SizedBox(height: 8),
                Text(
                  'Scan QR with your wallet',
                  style: larger.copyWith(
                    color: currentColorScheme(context).onBackground,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: MediaQuery.of(context).padding.bottom + 32)
              ],
            ),
          );
        },
      ),
    );
  }
}
