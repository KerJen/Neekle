import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';

import '../../../view/asset_screen/asset_screen.dart';
import '../../../view/home_screen/home_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true, path: '/'),
        AutoRoute(page: AssetRoute.page, path: '/asset'),
      ];
}
