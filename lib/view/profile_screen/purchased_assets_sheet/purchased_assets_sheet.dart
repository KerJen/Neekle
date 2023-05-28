import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/di/di.dart';
import '../../../core/helper/sheet_helper.dart';
import '../../../core/ui/colors.dart';
import '../../../core/ui/kit/bouncing_gesture_detector.dart';
import '../../../core/ui/kit/loading_indicator.dart';
import '../../../core/ui/text_styles.dart';
import '../../common/asset_item.dart';
import '../../common/empty_placeholder.dart';
import 'cubit/cubit.dart';

class PurchasedAssetsSheet extends StatefulWidget {
  const PurchasedAssetsSheet({super.key});

  static Future<void> show(BuildContext context) async {
    return BottomSheetHelper.show(
      context,
      (context, padding) => const PurchasedAssetsSheet(),
      isScrollControlled: true,
    );
  }

  @override
  State<PurchasedAssetsSheet> createState() => _PurchasedAssetsSheetState();
}

class _PurchasedAssetsSheetState extends State<PurchasedAssetsSheet> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<PurchasedAssetsCubit>(),
      child: Container(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom, left: 16, right: 16),
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.75,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Your purchases',
              style: title.copyWith(color: currentColorScheme(context).onBackground),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: BlocBuilder<PurchasedAssetsCubit, PurchasedAssetsState>(
                builder: (context, state) {
                  return state.maybeMap(
                    assets: (value) {
                      if (value.assets.isEmpty) {
                        return const Center(
                          child: EmptyPlaceholder(
                            icon: Icons.list_alt,
                            title: 'No assets here... yet :)',
                          ),
                        );
                      } else {
                        return ListView.separated(
                          padding: const EdgeInsets.only(top: 8, bottom: 32),
                          itemCount: value.assets.length,
                          itemBuilder: (context, index) {
                            final asset = value.assets[index].asset;
                            final link = value.assets[index].link;

                            return Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: currentColorScheme(context).surfaceVariant,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                children: [
                                  AssetItem(asset: asset),
                                  const SizedBox(height: 16),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Rate the asset',
                                        style: large.copyWith(color: currentColorScheme(context).onBackground),
                                      ),
                                      _RatingStarsChooser(
                                        initialRating: asset.rating ?? 0,
                                        onChoosed: (rating) {
                                          context.read<PurchasedAssetsCubit>().changeRating(
                                                asset: asset,
                                                rating: rating,
                                              );
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  _LinkButton(link: link),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(height: 16),
                        );
                      }
                    },
                    orElse: () => const Center(child: LoadingIndicator()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LinkButton extends StatelessWidget {
  final String? link;

  const _LinkButton({
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: currentColorScheme(context).surface.withOpacity(0.5),
      margin: EdgeInsets.zero,
      child: ListTile(
        onTap: () async {
          if (link != null) {
            await launchUrl(Uri.parse(link!));
          }
        },
        leading: const Icon(Icons.attachment_outlined),
        dense: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        title: Text(
          'Open file',
          style: medium.copyWith(color: currentColorScheme(context).onBackground),
        ),
        trailing: const Icon(Icons.keyboard_arrow_right),
      ),
    );
  }
}

class _RatingStarsChooser extends StatelessWidget {
  final double initialRating;
  final Function(double rating) onChoosed;

  const _RatingStarsChooser({
    required this.initialRating,
    required this.onChoosed,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      unratedColor: currentColorScheme(context).onSurface.withOpacity(0.4),
      initialRating: initialRating,
      onRatingUpdate: onChoosed,
      itemBuilder: (context, index) => const Icon(Icons.star, color: yellowColor),
      itemSize: 32,
    );
  }
}
