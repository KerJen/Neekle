import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../core/di/di.dart';
import '../../../core/ui/colors.dart';
import '../../../core/ui/kit/loading_indicator.dart';
import '../../../core/ui/text_styles.dart';
import '../../../domain/assets/entity/asset_entity.dart';
import '../../common/asset_card/asset_card.dart';
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

class _AssetsListState extends State<AssetsList> {
  late final AssetsListCubit _cubit = getIt.get();
  final _pagingController = PagingController<int, AssetEntity>(firstPageKey: 0);

  @override
  void initState() {
    super.initState();

    _pagingController.addPageRequestListener((pageKey) async {
      final lastAssetId = _pagingController.itemList?.last.id;

      if (widget.category != null) {
        _cubit.getCategoryAssets(widget.category!, lastAssetId);
      } else {
        _cubit.getFavoriteAssets(lastAssetId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: BlocListener<AssetsListCubit, AssetsListState>(
        listener: (context, state) {
          state.mapOrNull(
            assets: (value) {
              final isLastPage = value.assets.length < assetsPageSize;
              if (isLastPage) {
                _pagingController.appendLastPage(value.assets);
              } else {
                _pagingController.appendPage(value.assets, _pagingController.nextPageKey ?? 0 + 1);
              }
            },
          );
        },
        child: RefreshIndicator(
          backgroundColor: currentColorScheme(context).surfaceVariant,
          onRefresh: () async {
            _pagingController.refresh();
          },
          child: PagedGridView<int, AssetEntity>(
            pagingController: _pagingController,
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
            builderDelegate: PagedChildBuilderDelegate(
              firstPageProgressIndicatorBuilder: (context) => const LoadingIndicator(
                height: 32,
                width: 32,
              ),
              noItemsFoundIndicatorBuilder: (context) => Column(
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
              itemBuilder: (context, item, index) {
                return AssetCard(
                  asset: item,
                  onAddToShopcart: () {
                    _cubit.addToShopcart(item);
                  },
                );
              },
              animateTransitions: true,
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
