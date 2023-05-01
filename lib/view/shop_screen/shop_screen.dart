import 'package:flutter/material.dart';

import '../../core/ui/colors.dart';
import '../common/asset_card.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _SearchAppBar(),
      body: GridView.count(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 24),
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: [
          AssetCard(),
          AssetCard(),
          AssetCard(),
          AssetCard(),
          AssetCard(),
          AssetCard(),
          AssetCard(),
          AssetCard(),
          AssetCard(),
          AssetCard(),
          AssetCard(),
        ],
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
