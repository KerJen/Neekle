part of '../shopcart_sheet.dart';

class _BuyButton extends StatefulWidget {
  final double amount;

  const _BuyButton({
    required this.amount,
  });

  @override
  State<_BuyButton> createState() => _BuyButtonState();
}

class _BuyButtonState extends State<_BuyButton> {
  bool? isAuthorized;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ShopcartBuyButtonCubit>(),
      child: BlocConsumer<ShopcartBuyButtonCubit, ShopcartBuyButtonState>(
        listener: (context, state) {
          state.mapOrNull(
            auth: (value) {
              setState(() {
                isAuthorized = value.isAuthorized;
              });
            },
            bought: (value) {
              Future.delayed(const Duration(milliseconds: 500), () async {
                context.router.pop();
              });
            },
          );
        },
        builder: (context, state) {
          return Column(
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: Builder(
                  key: ValueKey(isAuthorized.toString() + (widget.amount == 0 ? '0' : '')),
                  builder: (context) {
                    if (isAuthorized == null) {
                      return const SizedBox(height: kButtonHeight, child: LoadingIndicator());
                    } else if (!isAuthorized!) {
                      return _OutlineButton(
                        onTap: () async => QrSheet.show(context),
                        child: Text(
                          'Connect via WalletConnect',
                          style: medium.copyWith(fontWeight: FontWeight.w600),
                        ),
                      );
                    } else {
                      if (widget.amount == 0.0) {
                        return _OutlineButton(
                          child: Text(
                            'No assets',
                            style: medium.copyWith(fontWeight: FontWeight.w600),
                          ),
                        );
                      }

                      return StateButton(
                        key: ValueKey(widget.amount),
                        onPressed: () {
                          context.read<ShopcartBuyButtonCubit>().buyAssets();
                        },
                        state: state.maybeMap(
                          loading: (_) => StateButtonState.loading(color: currentColorScheme(context).onBackground),
                          bought: (value) => const StateButtonState.success(child: Icon(Icons.done)),
                          failure: (_) => const StateButtonState.failed(message: 'Failed'),
                          orElse: () {
                            return StateButtonState.base(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(
                                    ethereumIcon,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    widget.amount.toString(),
                                    style: large.copyWith(
                                      color: currentColorScheme(context).onBackground,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.center,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'By purchasing, you accept the\n',
                        style: medium.copyWith(color: currentColorScheme(context).onSurface),
                      ),
                      TextSpan(
                        text: 'user agreement',
                        style: medium.copyWith(color: currentColorScheme(context).primary),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _OutlineButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget child;

  const _OutlineButton({
    this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BouncingGestureDetector(
      onTap: onTap,
      child: Container(
        height: kButtonHeight,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(21),
          border: Border.all(color: currentColorScheme(context).outlineVariant, width: 2),
        ),
        child: child,
      ),
    );
  }
}
