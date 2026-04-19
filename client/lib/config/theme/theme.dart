import 'package:client/config/theme/color_palette.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: ColorPalette.backgroundColor,
  );
}
