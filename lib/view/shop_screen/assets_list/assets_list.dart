import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../core/di/di.dart';
import '../../../core/ui/colors.dart';
import '../../../core/ui/kit/loading_indicator.dart';
import '../../../core/ui/router/router.dart';
import '../../../core/ui/text_styles.dart';
import '../../../domain/assets/entity/asset_entity.dart';
import '../../common/asset_card.dart';
import '../../common/empty_placeholder.dart';
import 'cubit/cubit.dart';

const int assetsPageSize = 10;

class AssetsList extends StatefulWidget {
  final String? category;

  const AssetsList({
    super.key,
    this.category,
  });

  @override
  State<AssetsList> createState() => _AssetsListState();
}

class _AssetsListState extends State<AssetsList> with AutomaticKeepAliveClientMixin {
  late final AssetsListCubit _cubit;
  final _pagingController = PagingController<int, ({bool inShopcart, AssetEntity asset})>(firstPageKey: 0);

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _cubit = getIt.get(param1: widget.category);

    _pagingController.addPageRequestListener((pageKey) async {
      final lastAssetId = _pagingController.itemList?.last.asset.id;
      _cubit.loadMore(lastAssetId);
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => _cubit,
      child: BlocListener<AssetsListCubit, AssetsListState>(
        listener: (context, state) {
          state.mapOrNull(
            assets: (value) {
              final currentAssetIds = _pagingController.itemList?.map((e) => e.asset.id).toSet() ?? {};
              final newAssetIds = value.assets.map((e) => e.asset.id).toSet();

              final addableAssetIds = newAssetIds.difference(currentAssetIds);
              final changableAssetIds = currentAssetIds.intersection(newAssetIds);

              final addableAssets =
                  value.assets.where((asset) => addableAssetIds.contains(asset.asset.id)).toList(growable: false);

              final changableAssets =
                  value.assets.where((asset) => changableAssetIds.contains(asset.asset.id)).toList(growable: false);

              for (final asset in changableAssets) {
                final replacementIndex =
                    _pagingController.itemList?.indexWhere((element) => element.asset.id == asset.asset.id) ?? -1;

                _pagingController.itemList?[replacementIndex] = asset;
              }

              setState(() {});

              final isLastPage = addableAssets.length < assetsPageSize;
              if (isLastPage) {
                _pagingController.appendLastPage(addableAssets);
              } else {
                _pagingController.appendPage(addableAssets, _pagingController.nextPageKey ?? 0 + 1);
              }
            },
          );
        },
        child: RefreshIndicator(
          backgroundColor: currentColorScheme(context).surfaceVariant,
          onRefresh: () async {
            _pagingController.refresh();
          },
          child: PagedGridView<int, ({bool inShopcart, AssetEntity asset})>(
            pagingController: _pagingController,
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
            builderDelegate: PagedChildBuilderDelegate(
              firstPageProgressIndicatorBuilder: (context) => const LoadingIndicator(
                height: 32,
                width: 32,
              ),
              noItemsFoundIndicatorBuilder: (context) => const EmptyPlaceholder(
                icon: Icons.list_alt,
                title: 'No assets here... yet :)',
              ),
              itemBuilder: (context, item, index) {
                return FadeInDown(
                  preferences: AnimationPreferences(
                    magnitude: 0.15,
                    offset: Duration(milliseconds: index % 2 == 0 ? 100 : 200),
                    duration: const Duration(milliseconds: 400),
                  ),
                  child: AssetCard(
                    key: ValueKey(item.asset.id),
                    asset: item.asset,
                    inShopcart: item.inShopcart,
                    onPressed: () async {
                      context.router.push(AssetRoute(assetId: item.asset.id));
                    },
                    onShopcartStateChanged: (isAdd) {
                      isAdd ? _cubit.addToShopcart(item.asset) : _cubit.removeFromShopcart(item.asset.id);
                    },
                  ),
                );
              },
              // animateTransitions: true,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
            ),
          ),
        ),
      ),
    );
  }
}
