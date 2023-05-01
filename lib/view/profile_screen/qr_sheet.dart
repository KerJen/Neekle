import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../core/helper/sheet_helper.dart';
import '../../core/ui/colors.dart';
import '../../core/ui/text_styles.dart';
import 'cubit/cubit.dart';

class QrSheet extends StatefulWidget {
  final String data;
  final ProfileCubit cubit;

  const QrSheet({
    super.key,
    required this.data,
    required this.cubit,
  });

  static Future<void> show(BuildContext context, {required String data, required ProfileCubit cubit}) async {
    return BottomSheetHelper.show(
      context,
      (context, padding) => QrSheet(
        data: data,
        cubit: cubit,
      ),
      isScrollControlled: true,
    );
  }

  @override
  State<QrSheet> createState() => _QrSheetState();
}

class _QrSheetState extends State<QrSheet> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      bloc: widget.cubit,
      listener: (context, state) {
        state.mapOrNull(
          profile: (value) {
            if (value.profile != null) {
              Navigator.pop(context);
            }
          },
        );
      },
      child: Container(
        color: currentColorScheme(context).background,
        child: Column(
          children: [
            QrImage(
              data: widget.data,
              foregroundColor: currentColorScheme(context).onBackground,
              padding: const EdgeInsets.all(32),
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
      ),
    );
  }
}
