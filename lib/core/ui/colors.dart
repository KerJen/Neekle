import 'package:flutter/material.dart';

ColorScheme currentColorScheme(context) => darkColorScheme;

final darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: const Color(0xFF0AFFA7),
  onPrimary: Colors.white,
  primaryContainer: const Color(0xFF20CF90),
  secondary: const Color(0xFF0AFFA7).withOpacity(0.2),
  onSecondary: const Color(0xFF0AFFA7),
  error: const Color(0xFFFF3D00).withOpacity(0.8),
  onError: Colors.white,
  background: const Color(0xFF131621),
  onBackground: Colors.white,
  surfaceVariant: const Color(0xFF191D2C),
  surface: const Color(0xFF23293E),
  onSurface: const Color(0xFF4B5475),
  outline: const Color(0xFF4B5475),
  outlineVariant: const Color(0xFF23293E),
  surfaceTint: Colors.transparent,
);

const yellowColor = Color(0xFFFFC700);
