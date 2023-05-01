import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/di/di.dart';
import '../../core/ui/colors.dart';
import '../../core/ui/const.dart';
import '../../core/ui/kit/bouncing_gesture_detector.dart';
import '../../core/ui/text_styles.dart';
import 'cubit/cubit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  double? balance;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<ProfileCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('0xFFFEFEFEFE9w9w'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
          ),
          child: Column(
            children: [
              _ConnectWallet(
                balance: null,
                onConnect: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ConnectWallet extends StatelessWidget {
  final double? balance;
  final VoidCallback onConnect;

  const _ConnectWallet({
    this.balance,
    required this.onConnect,
  });

  @override
  Widget build(BuildContext context) {
    Widget content;

    if (balance == null) {
      content = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Connect via WalletConnect',
            style: medium.copyWith(fontWeight: FontWeight.w600),
          ),
          Icon(
            Icons.keyboard_arrow_right,
            color: currentColorScheme(context).onSurface,
          )
        ],
      );
    } else {
      content = Row(
        children: [
          Text(
            'Wallet',
            style: medium.copyWith(
              color: currentColorScheme(context).onSecondaryContainer,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          SvgPicture.asset(ethereumIcon),
          const SizedBox(width: 4),
          Text(
            '444.44',
            style: medium.copyWith(
              color: currentColorScheme(context).onSecondaryContainer,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      );
    }

    return BouncingGestureDetector(
      onTap: balance != null ? onConnect : null,
      child: AnimatedContainer(
        height: 56,
        duration: const Duration(milliseconds: 200),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: balance == null ? Colors.transparent : currentColorScheme(context).secondaryContainer,
          border: balance == null ? Border.all(color: currentColorScheme(context).outlineVariant, width: 2) : null,
        ),
        child: content,
      ),
    );
  }
}
