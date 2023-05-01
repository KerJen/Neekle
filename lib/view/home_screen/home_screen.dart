import 'package:flutter/material.dart';
import 'package:neekle/core/ui/colors.dart';
import 'package:neekle/core/ui/text_styles.dart';

import '../profile_screen/profile_screen.dart';
import '../shop_screen/shop_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          ShopScreen(),
          Container(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(height: 1, color: currentColorScheme(context).outlineVariant),
          NavigationBar(
            selectedIndex: _currentIndex,
            onDestinationSelected: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            destinations: [
              const NavigationDestination(
                icon: Icon(Icons.shopping_cart_outlined),
                label: 'Shop',
              ),
              _StudioIcon(
                selected: _currentIndex == 1,
                onSelected: () {
                  setState(() {
                    _currentIndex = 1;
                  });
                },
              ),
              const NavigationDestination(
                icon: Icon(Icons.face),
                label: 'Profile',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StudioIcon extends StatelessWidget {
  final bool selected;
  final VoidCallback onSelected;

  const _StudioIcon({
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: selected ? currentColorScheme(context).secondaryContainer : currentColorScheme(context).surface,
            ),
            child: Icon(
              Icons.home_repair_service_outlined,
              size: 20,
              color: selected ? currentColorScheme(context).primary : currentColorScheme(context).onSurface,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Studio',
            style: medium.copyWith(
              color: selected ? currentColorScheme(context).primary : medium.color,
            ),
          )
        ],
      ),
    );
  }
}
