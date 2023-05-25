part of '../shopcart_sheet.dart';

class _BuyButton extends StatelessWidget {
  final double? amount;

  const _BuyButton({
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ShopcartBuyButtonCubit>(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Buy for:',
              style: larger.copyWith(
                color: currentColorScheme(context).onBackground,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            AppButton(
              height: 42,
              borderRadius: BorderRadius.circular(21),
              color: currentColorScheme(context).primary.withOpacity(0.7),
              alignment: Alignment.center,
              onTap: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    ethereumIcon,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    amount?.toStringAsFixed(5).toString() ?? '0.00000',
                    style: large.copyWith(color: currentColorScheme(context).onBackground, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
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
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
