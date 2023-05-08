import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../core/di/di.dart';
import '../../core/ui/colors.dart';
import '../../core/ui/kit/bouncing_gesture_detector.dart';
import '../../core/ui/kit/loading_indicator.dart';
import '../../core/ui/text_styles.dart';
import '../../domain/assets/entity/asset_entity.dart';
import '../common/asset_card.dart';
import 'cubit/cubit.dart';

class StudioScreen extends StatefulWidget {
  const StudioScreen({super.key});

  @override
  State<StudioScreen> createState() => _StudioScreenState();
}

class _StudioScreenState extends State<StudioScreen> {
  final StudioCubit _cubit = getIt.get();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: MediaQuery.of(context).viewPadding.top + 16)),
              SliverToBoxAdapter(child: _DayHintPanel()),
              const SliverToBoxAdapter(child: SizedBox(height: 32)),
              BlocBuilder<StudioCubit, StudioState>(
                builder: (context, state) {
                  return state.maybeMap(
                    needLogIn: (value) {
                      return SliverToBoxAdapter(
                        child: Text('ffff'),
                      );
                    },
                    studio: (value) {
                      return MultiSliver(
                        children: [
                          SliverPadding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            sliver: SliverToBoxAdapter(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Showcase',
                                    style: title.copyWith(
                                      color: currentColorScheme(context).onBackground,
                                    ),
                                  ),
                                  BouncingGestureDetector(
                                    child: Text(
                                      'Create',
                                      style: medium.copyWith(
                                        color: currentColorScheme(context).primary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (value.showcase.isEmpty)
                            SliverFillRemaining(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.list_alt,
                                    size: 64,
                                    color: currentColorScheme(context).onSurface,
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'No assets here... yet :)',
                                    style: larger.copyWith(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            )
                          else
                            SliverGrid(
                              delegate: SliverChildBuilderDelegate(
                                childCount: value.showcase.length,
                                (context, index) {
                                  return AssetCard(asset: value.showcase[index]);
                                },
                              ),
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 16,
                                crossAxisSpacing: 16,
                              ),
                            ),
                        ],
                      );
                    },
                    orElse: () => const SliverToBoxAdapter(child: LoadingIndicator()),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _DayHintPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: currentColorScheme(context).secondaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Hint of the day',
                style: title.copyWith(color: currentColorScheme(context).onSecondaryContainer),
              ),
              BouncingGestureDetector(
                child: Icon(
                  Icons.close,
                  color: currentColorScheme(context).onSecondaryContainer,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'Your studio with showcases and assets there. Create different categories and sell them to your target audience',
            style: medium.copyWith(color: currentColorScheme(context).onSecondaryContainer),
          ),
        ],
      ),
    );
  }
}
