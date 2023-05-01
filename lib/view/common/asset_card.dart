import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/ui/const.dart';
import '../../core/ui/kit/bouncing_gesture_detector.dart';
import 'rating_stars.dart';

import '../../core/ui/colors.dart';
import '../../core/ui/kit/button.dart';
import '../../core/ui/kit/image.dart';
import '../../core/ui/text_styles.dart';

class AssetCard extends StatelessWidget {
  const AssetCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BouncingGestureDetector(
      onTap: () {},
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            height: constraints.maxHeight,
            decoration: BoxDecoration(
              color: currentColorScheme(context).surfaceVariant,
              border: Border.all(
                color: currentColorScheme(context).outlineVariant,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    AppImage(
                      height: constraints.maxHeight * (5 / 10),
                      width: constraints.maxWidth,
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                      image: const NetworkImage(
                        'https://picsum.photos/200/300',
                      ),
                    ),
                    Container(
                      height: 54,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            currentColorScheme(context).surfaceVariant,
                            currentColorScheme(context).surfaceVariant.withOpacity(0),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SvgPicture.asset(
                            ethereumIcon,
                            color: currentColorScheme(context).onBackground,
                          ),
                          Text(
                            '0.444',
                            style: larger.copyWith(
                              color: currentColorScheme(context).onBackground,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: constraints.maxHeight * (5 / 10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Text(
                          'Hello hello hello hellow  hell',
                          style: medium.copyWith(
                            color: currentColorScheme(context).onBackground,
                            fontWeight: FontWeight.w600,
                            height: 1.25,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const RatingStars(
                              rating: 3.3,
                              itemSize: 16,
                            ),
                            AppButton(
                              height: 28,
                              width: 52,
                              borderRadius: BorderRadius.circular(14),
                              onTap: () {},
                              child: Icon(
                                Icons.shopping_cart_outlined,
                                size: 18,
                                color: currentColorScheme(context).primary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
