import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/di/di.dart';
import '../../core/ui/colors.dart';
import '../../core/const.dart';
import '../../core/ui/kit/back_button.dart';
import '../../core/ui/kit/button.dart';
import '../../core/ui/kit/dot_slider.dart';
import '../../core/ui/kit/image.dart';
import '../../core/ui/kit/loading_indicator.dart';
import '../../core/ui/kit/tags.dart';
import '../../core/ui/text_styles.dart';
import '../common/rating_stars.dart';
import 'cubit/cubit.dart';

@RoutePage()
class AssetScreen extends StatefulWidget {
  final String assetId;

  const AssetScreen({super.key, required this.assetId});

  @override
  State<AssetScreen> createState() => _AssetScreenState();
}

class _AssetScreenState extends State<AssetScreen> {
  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<AssetCubit>(param1: widget.assetId),
      child: BlocBuilder<AssetCubit, AssetState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leadingWidth: 64 + 16,
              leading: const Padding(
                padding: EdgeInsets.only(left: 16),
                child: AppBackButton(),
              ),
              actions: [
                state.maybeMap(
                  asset: (value) => Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: IconButton(
                      onPressed: () {
                        context.read<AssetCubit>().toggleFavorite();
                      },
                      icon: value.asset.isFavorite ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border),
                    ),
                  ),
                  orElse: () => const SizedBox.shrink(),
                )
              ],
            ),
            body: state.maybeMap(
              asset: (value) {
                final asset = value.asset.asset;
                final allImageUrls = [asset.coverUrl, ...asset.imageUrls];

                return SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 196,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Stack(
                            children: [
                              PageView.builder(
                                itemCount: allImageUrls.length,
                                onPageChanged: (index) {
                                  setState(() {
                                    _currentImageIndex = index;
                                  });
                                },
                                itemBuilder: (context, index) {
                                  return AppImage(
                                    borderRadius: BorderRadius.circular(8),
                                    height: 196,
                                    width: MediaQuery.of(context).size.width - 16 * 2,
                                    image: NetworkImage(allImageUrls[index]),
                                  );
                                },
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: RatingStars(
                                    rating: asset.rating ?? 0,
                                    itemSize: 24,
                                  ),
                                ),
                              ),
                              if (allImageUrls.length > 1)
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: DotSlider(
                                      currentIndex: _currentImageIndex,
                                      count: allImageUrls.length,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      if (asset.tags.isNotEmpty) AppTags(tags: asset.tags),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              asset.title,
                              style: headline.copyWith(color: currentColorScheme(context).onBackground),
                              maxLines: 2,
                            ),
                          ),
                          const SizedBox(width: 16),
                          SvgPicture.asset(
                            ethereumIcon,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            asset.price.toString(),
                            style: headline.copyWith(color: currentColorScheme(context).onBackground),
                            maxLines: 2,
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        asset.description,
                        style: medium,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Icon(
                            Icons.attach_file,
                            color: currentColorScheme(context).onSurface,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          const Text('46.6 MB'),
                          const Spacer(),
                          Icon(
                            Icons.file_copy_outlined,
                            color: currentColorScheme(context).onSurface,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(asset.ext),
                        ],
                      )
                    ],
                  ),
                );
              },
              orElse: () => const Center(child: LoadingIndicator()),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: state.maybeMap(
                asset: (value) {
                  return AppButton(
                    height: 48,
                    borderRadius: BorderRadius.circular(24),
                    alignment: Alignment.center,
                    color: value.asset.inShopcart
                        ? currentColorScheme(context).surface
                        : currentColorScheme(context).primaryContainer,
                    onTap: () {
                      if (value.asset.inShopcart) {
                        context.read<AssetCubit>().removeFromShopcart(value.asset.asset.id);
                      } else {
                        context.read<AssetCubit>().addToShopcart(value.asset.asset);
                      }
                    },
                    child: value.asset.inShopcart
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.remove_shopping_cart_outlined,
                                size: 18,
                              ),
                              const SizedBox(width: 12),
                              Text(
                                'Remove from cart',
                                style: medium.copyWith(
                                    color: currentColorScheme(context).onBackground, fontWeight: FontWeight.w600),
                              ),
                            ],
                          )
                        : Text(
                            'Add to cart',
                            style: medium.copyWith(color: currentColorScheme(context).onBackground),
                          ),
                  );
                },
                orElse: () => const SizedBox.shrink(),
              ),
            ),
          );
        },
      ),
    );
  }
}
