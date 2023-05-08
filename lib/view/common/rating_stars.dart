import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../core/ui/colors.dart';

class RatingStars extends StatelessWidget {
  final double rating;
  final double itemSize;

  const RatingStars({
    super.key,
    required this.rating,
    required this.itemSize,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      unratedColor: currentColorScheme(context).onSurface.withOpacity(0.4),
      rating: rating,
      itemBuilder: (context, index) => const Icon(
        Icons.star,
        color: yellowColor,
      ),
      itemSize: itemSize,
    );
  }
}
