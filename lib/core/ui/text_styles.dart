import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

final baseFont = GoogleFonts.poppins();

TextStyle small = baseFont.copyWith(fontSize: 12);
TextStyle medium = baseFont.copyWith(fontSize: 14);
TextStyle large = baseFont.copyWith(fontSize: 16);
TextStyle larger = baseFont.copyWith(fontSize: 18);
TextStyle title = baseFont.copyWith(fontSize: 20, fontWeight: FontWeight.w600);
TextStyle headline = baseFont.copyWith(fontSize: 24, fontWeight: FontWeight.w600);

InputDecoration filledInputDecoration(BuildContext context) => InputDecoration(
      filled: true,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(8),
      ),
      hintStyle: medium.copyWith(color: currentColorScheme(context).onSurface),
      labelStyle: medium.copyWith(color: currentColorScheme(context).onBackground),
    );
