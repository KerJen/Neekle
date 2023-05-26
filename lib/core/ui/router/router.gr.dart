// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AssetRoute.name: (routeData) {
      final args = routeData.argsAs<AssetRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AssetScreen(
          key: args.key,
          assetId: args.assetId,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
  };
}

/// generated route for
/// [AssetScreen]
class AssetRoute extends PageRouteInfo<AssetRouteArgs> {
  AssetRoute({
    Key? key,
    required String assetId,
    List<PageRouteInfo>? children,
  }) : super(
          AssetRoute.name,
          args: AssetRouteArgs(
            key: key,
            assetId: assetId,
          ),
          initialChildren: children,
        );

  static const String name = 'AssetRoute';

  static const PageInfo<AssetRouteArgs> page = PageInfo<AssetRouteArgs>(name);
}

class AssetRouteArgs {
  const AssetRouteArgs({
    this.key,
    required this.assetId,
  });

  final Key? key;

  final String assetId;

  @override
  String toString() {
    return 'AssetRouteArgs{key: $key, assetId: $assetId}';
  }
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
