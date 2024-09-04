import 'package:flutter/material.dart';

// Colors
class AppColors {
  static const cyan = Color(0xFF00cdbd);
  static const white = Colors.white;
  static const black = Colors.black;
  static const grey = Colors.grey;
  static const transparent = Colors.transparent;
}

// Color Schemes
class AppColorScheme {
  static const lightColorScheme = ColorScheme.light(primary: AppColors.cyan);
  static const darkColorScheme = ColorScheme.dark(primary: AppColors.cyan);
}
