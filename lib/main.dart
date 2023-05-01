import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neekle/core/ui/colors.dart';
import 'package:neekle/view/home_screen/home_screen.dart';

import 'core/di/di.dart';
import 'core/ui/text_styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        appBarTheme: AppBarTheme(
          backgroundColor: currentColorScheme(context).background,
          titleTextStyle: headline,
          centerTitle: false,
        ),
        textTheme: TextTheme(
          bodySmall: small,
          bodyMedium: medium,
          bodyLarge: large,
          titleSmall: larger,
          titleMedium: title,
          titleLarge: headline,
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: currentColorScheme(context).background,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
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
      home: const HomeScreen(),
    );
  }
}
