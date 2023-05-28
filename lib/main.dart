import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';
import 'core/ui/colors.dart';

import 'core/di/di.dart';
import 'core/const.dart';
import 'core/ui/router/router.dart';
import 'core/ui/text_styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.white,
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          elevation: 2,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: currentColorScheme(context).background,
          titleTextStyle: headline,
          centerTitle: false,
        ),
        tabBarTheme: const TabBarTheme(
          indicator: BoxDecoration(),
          labelPadding: EdgeInsets.zero,
          splashFactory: NoSplash.splashFactory,
          overlayColor: MaterialStatePropertyAll(Colors.transparent),
          dividerColor: Colors.transparent,
        ),
        textTheme: TextTheme(
          bodySmall: small,
          bodyMedium: medium,
          bodyLarge: large.copyWith(color: currentColorScheme(context).onBackground),
          titleSmall: larger,
          titleMedium: title,
          titleLarge: headline,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: false,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: currentColorScheme(context).surface),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: currentColorScheme(context).surface),
            borderRadius: BorderRadius.circular(8),
          ),
          hintStyle: medium.copyWith(color: currentColorScheme(context).onSurface),
          labelStyle: medium.copyWith(color: currentColorScheme(context).onBackground),
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: currentColorScheme(context).background,
          elevation: 0,
          labelTextStyle: MaterialStateProperty.resolveWith(
            (states) {
              final currentStyle = medium;
              if (states.contains(MaterialState.selected)) {
                return currentStyle.copyWith(
                  color: currentColorScheme(context).primary,
                  fontWeight: FontWeight.w600,
                );
              }

              return currentStyle;
            },
          ),
        ),
      ),
      routerConfig: _appRouter.config(),
    );
  }
}
