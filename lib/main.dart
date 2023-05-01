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
        textTheme: TextTheme(
          bodySmall: small,
          bodyMedium: medium,
          bodyLarge: large.copyWith(color: currentColorScheme(context).onBackground),
          titleSmall: larger,
          titleMedium: title,
          titleLarge: headline,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
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
      home: const HomeScreen(),
    );
  }
}
