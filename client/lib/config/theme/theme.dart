import 'package:client/config/theme/color_palette.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static OutlineInputBorder _border(Color color) => OutlineInputBorder(
    borderSide: BorderSide(color: color, width: 3),
    borderRadius: BorderRadius.circular(10),
  );
  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: ColorPalette.backgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(26),
      enabledBorder: _border(ColorPalette.borderColor),
      focusedBorder: _border(ColorPalette.gradient2),
    ),
  );
}
