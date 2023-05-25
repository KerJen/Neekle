import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/di/di.dart';
import '../../../core/helper/sheet_helper.dart';
import '../../../core/ui/colors.dart';
import '../../../core/ui/const.dart';
import '../../../core/ui/kit/button.dart';
import '../../../core/ui/kit/image.dart';
import '../../../core/ui/text_styles.dart';
import 'cubit/cubit.dart';
import 'widgets/cubit/cubit.dart';
part 'widgets/buy_button.dart';

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
              state.maybeMap(
                cart: (value) => SizedBox(
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: ListView.separated(
                    itemCount: value.assets.length,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemBuilder: (context, index) {
                      final asset = value.assets[index];

                      return Row(
                        children: [
                          AppImage(
                            height: 56,
                            width: 94,
                            borderRadius: BorderRadius.circular(8),
                            image: NetworkImage(asset.coverUrl),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              asset.title,
                              style: large.copyWith(color: currentColorScheme(context).onBackground),
                            ),
                          ),
                          const SizedBox(width: 8),
                          SvgPicture.asset(
                            ethereumIcon,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            asset.price.toString(),
                            style: large.copyWith(
                                color: currentColorScheme(context).onBackground, fontWeight: FontWeight.w600),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(height: 16),
                  ),
                ),
                orElse: () => Icon(Icons.abc),
              ),
              const SizedBox(height: 32),
              _BuyButton(
                amount: state.mapOrNull(
                  cart: (value) => value.assets.fold(0, (prev, cur) => prev! + cur.price),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
