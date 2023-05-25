part of '../shopcart_sheet.dart';

class _BuyButton extends StatefulWidget {
  final double? amount;

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
          );
        },
        builder: (context, state) {
          if (isAuthorized == null) {
            return const SizedBox(height: kButtonHeight, child: LoadingIndicator());
          }

          if (isAuthorized!) {
            return StateButton(
              onPressed: () {},
              state: state.maybeMap(
                loading: (_) => const StateButtonState.loading(),
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
                              color: currentColorScheme(context).onBackground, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          } else {
            return BouncingGestureDetector(
              onTap: () async => QrSheet.show(context),
              child: Container(
                height: kButtonHeight,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21),
                  border: Border.all(color: currentColorScheme(context).outlineVariant, width: 2),
                ),
                child: Text(
                  'Connect via WalletConnect',
                  style: medium.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
