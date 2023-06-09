import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/di/di.dart';
import '../../../core/helper/sheet_helper.dart';
import '../../../core/ui/colors.dart';
import '../../../core/const.dart';
import '../../../core/ui/kit/bouncing_gesture_detector.dart';
import '../../../core/ui/kit/image.dart';
import '../../../core/ui/kit/loading_indicator.dart';
import '../../../core/ui/kit/state_button/state_button.dart';
import '../../../core/ui/router/router.dart';
import '../../../core/ui/text_styles.dart';
import '../../../domain/assets/entity/asset_entity.dart';
import '../../common/asset_item.dart';
import '../../qr_sheet/qr_sheet.dart';
import 'buy_button/cubit/cubit.dart';
import 'cubit/cubit.dart';

part 'buy_button/buy_button.dart';

class ShopcartSheet extends StatefulWidget {
  const ShopcartSheet({super.key});

  static Future<void> show(BuildContext context) async {
    return BottomSheetHelper.show(
      context,
      (context, padding) => const ShopcartSheet(),
      isScrollControlled: true,
    );
  }

  @override
  State<ShopcartSheet> createState() => _ShopcartSheetState();
}

class _ShopcartSheetState extends State<ShopcartSheet> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<ShopcartCubit>(),
      child: BlocBuilder<ShopcartCubit, ShopcartState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Shopcart',
                      style: title.copyWith(
                        color: currentColorScheme(context).onBackground,
                      ),
                    ),
                    Text('${state.mapOrNull(cart: (value) => value.assets.length) ?? 0} items'),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.45,
                child: state.maybeMap(
                  cart: (value) => value.assets.isNotEmpty
                      ? ListView.separated(
                          itemCount: value.assets.length,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemBuilder: (context, index) {
                            final asset = value.assets[index];
                            return Dismissible(
                              key: ValueKey(asset),
                              onDismissed: (_) => context.read<ShopcartCubit>().removeFromShopcart(asset.id),
                              direction: DismissDirection.endToStart,
                              background: Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Icon(
                                    Icons.delete_outline,
                                    color: currentColorScheme(context).onSurface,
                                  ),
                                ),
                              ),
                              child: AssetItem(asset: asset),
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(height: 16),
                        )
                      : const _ShopcartPlaceholder(),
                  orElse: () => const _ShopcartPlaceholder(),
                ),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _BuyButton(
                  amount: state.mapOrNull(
                        cart: (value) => value.assets.fold(0, (prev, cur) => prev! + cur.price),
                      ) ??
                      0,
                ),
              ),
              const SizedBox(height: 32),
            ],
          );
        },
      ),
    );
  }
}

class _ShopcartPlaceholder extends StatelessWidget {
  const _ShopcartPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add_shopping_cart,
            size: 64,
            color: currentColorScheme(context).onSurface,
          ),
          const SizedBox(height: 16),
          Text(
            'Shopcart is empty... yet :)',
            style: larger.copyWith(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
