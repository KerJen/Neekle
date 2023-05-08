import 'package:flutter/material.dart';
import '../../core/ui/colors.dart';
import '../../core/ui/const.dart';
import '../../core/ui/text_styles.dart';
import 'assets_list/assets_list.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> with TickerProviderStateMixin {
  late final _tabController = TabController(length: shopCategories.length + 1, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _SearchAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          AnimatedBuilder(
            animation: _tabController,
            builder: (context, _) {
              return TabBar(
                controller: _tabController,
                isScrollable: true,
                dividerColor: Colors.transparent,
                labelStyle: medium,
                unselectedLabelColor: currentColorScheme(context).surface,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                labelPadding: const EdgeInsets.only(right: 12),
                tabs: [
                  _FavoriteTab(enabled: _tabController.index == 0),
                  for (int i = 0; i < shopCategories.length; i++)
                    _AssetsCategory(
                      enabled: _tabController.index - 1 == i,
                      title: shopCategories[i],
                    )
                ],
              );
            },
          ),
          const SizedBox(height: 8),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                const AssetsList(),
                for (final category in shopCategories) AssetsList(category: category),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        child: const Icon(Icons.shopping_cart_outlined),
      ),
    );
  }
}

class _SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _SearchAppBar();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            prefixIconConstraints: const BoxConstraints(
              maxHeight: 18,
              minWidth: 44,
            ),
            prefixIcon: Icon(
              Icons.search,
              size: 18,
              color: currentColorScheme(context).onSurface,
            ),
            contentPadding: const EdgeInsets.only(top: 6, bottom: 6, right: 16),
            isCollapsed: true,
          ),
        ),
      ),
    );
  }
}

class _FavoriteTab extends StatelessWidget {
  final bool enabled;

  const _FavoriteTab({required this.enabled});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.fastOutSlowIn,
      height: 32,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: enabled ? redColor : redColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: Icon(
          Icons.favorite,
          key: ValueKey(enabled),
          color: enabled ? currentColorScheme(context).onBackground : redColor.withOpacity(0.2),
        ),
      ),
    );
  }
}

class _AssetsCategory extends StatelessWidget {
  final bool enabled;
  final String title;

  const _AssetsCategory({
    required this.enabled,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 32,
      duration: const Duration(milliseconds: 200),
      curve: Curves.fastOutSlowIn,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: enabled ? currentColorScheme(context).onSurface : currentColorScheme(context).surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: Text(
          title,
          key: ValueKey(enabled),
          style: medium.copyWith(
            color: enabled ? currentColorScheme(context).onBackground : currentColorScheme(context).onSurface,
          ),
        ),
      ),
    );
  }
}
