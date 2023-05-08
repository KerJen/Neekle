import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/ui/colors.dart';
import '../../core/ui/const.dart';
import '../../core/ui/kit/back_button.dart';
import '../../core/ui/kit/button.dart';
import '../../core/ui/kit/dot_slider.dart';
import '../../core/ui/kit/image.dart';
import '../../core/ui/kit/tags.dart';
import '../../core/ui/text_styles.dart';
import '../../domain/assets/entity/asset_entity.dart';
import '../common/rating_stars.dart';

@RoutePage()
class AssetScreen extends StatefulWidget {
  final AssetEntity asset;

  const AssetScreen({
    super.key,
    required this.asset,
  });

  @override
  State<AssetScreen> createState() => _AssetScreenState();
}

class _AssetScreenState extends State<AssetScreen> {
  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final allImageUrls = [widget.asset.coverUrl, ...widget.asset.imageUrls];

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 64 + 16,
        leading: const Padding(
          padding: EdgeInsets.only(left: 16),
          child: AppBackButton(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
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
                          rating: widget.asset.rating ?? 0,
                          itemSize: 24,
                        ),
                      ),
                    ),
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
            if (widget.asset.tags.isNotEmpty) AppTags(tags: widget.asset.tags),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.asset.title,
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
                  widget.asset.price.toString(),
                  style: headline.copyWith(color: currentColorScheme(context).onBackground),
                  maxLines: 2,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              widget.asset.description,
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
                Text('46.6 MB'),
                const Spacer(),
                Icon(
                  Icons.file_copy_outlined,
                  color: currentColorScheme(context).onSurface,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(widget.asset.ext),
              ],
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: AppButton(
          height: 48,
          borderRadius: BorderRadius.circular(24),
          alignment: Alignment.center,
          color: currentColorScheme(context).primaryContainer,
          onTap: () {},
          child: Text(
            'Add to cart',
            style: medium.copyWith(color: currentColorScheme(context).onBackground),
          ),
        ),
      ),
    );
  }
}
