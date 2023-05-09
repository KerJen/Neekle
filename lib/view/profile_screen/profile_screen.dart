import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/di/di.dart';
import '../../core/ui/colors.dart';
import '../../core/ui/const.dart';
import '../../core/ui/kit/bouncing_gesture_detector.dart';
import '../../core/ui/kit/loading_indicator.dart';
import '../../core/ui/text_styles.dart';
import '../qr_sheet/qr_sheet.dart';
import 'cubit/cubit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<ProfileCubit>(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(state.mapOrNull(profile: (value) => value.profile?.address) ?? 'Profile'),
              actions: [
                if (state.mapOrNull(profile: (value) => value.profile != null) ?? false)
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: IconButton(
                      onPressed: () {
                        context.read<ProfileCubit>().logOut();
                      },
                      icon: const Icon(
                        Icons.logout,
                      ),
                    ),
                  ),
              ],
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
              ),
              child: Column(
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: state.mapOrNull(
                          loading: (_) => const _ConnectWalletLoading(),
                          profile: (value) {
                            if (value.profile != null) {
                              return _Wallet(balance: value.profile!.balance);
                            }
                            return null;
                          },
                        ) ??
                        _ConnectWallet(
                          onConnect: () async => QrSheet.show(context),
                        ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ConnectWalletLoading extends StatelessWidget {
  const _ConnectWalletLoading();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: currentColorScheme(context).outlineVariant, width: 2),
      ),
      child: const LoadingIndicator(),
    );
  }
}

class _ConnectWallet extends StatelessWidget {
  final VoidCallback onConnect;

  const _ConnectWallet({
    required this.onConnect,
  });

  @override
  Widget build(BuildContext context) {
    return BouncingGestureDetector(
      onTap: onConnect,
      child: Container(
        height: 56,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: currentColorScheme(context).outlineVariant, width: 2),
        ),
        child: Row(
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
        ),
      ),
    );
  }
}

class _Wallet extends StatelessWidget {
  final double balance;

  const _Wallet({required this.balance});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 56,
      duration: const Duration(milliseconds: 200),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: currentColorScheme(context).secondaryContainer,
      ),
      child: Row(
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
            balance.toStringAsFixed(5),
            style: medium.copyWith(
              color: currentColorScheme(context).onSecondaryContainer,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
