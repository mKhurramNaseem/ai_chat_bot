import 'package:flutter/material.dart';

// Colors
class AppColors {
  static const cyan = Color(0xFF00cdbd);
  static const white = Colors.white;
  static const black = Colors.black;
  static const grey = Colors.grey;
  static const red = Colors.red;
  static const transparent = Colors.transparent;
  static final barrierColor = Colors.blueGrey.shade900.withOpacity(0.8);
  static final darkBarrierColor = const Color(0xff0c121e).withOpacity(0.6);
  static const tileBackgroundColor = Color(0xff1f222b);
  static const dialogColor = Colors.white;
  static const darkDialogColor = Color(0xff1f222b);
  static const lightButtonColor = Color(0xffe6faf8);
  static const darkButtonColor = Color(0xff35383f);
  static const lightButtonForegroundColor = Colors.cyan;
  static const darkButtonForegroundColor = Colors.white;
  static const chatBoxColor = Color(0xff35383f);
  static const darkInputFieldFocusBackgroundColor = Color(0xff16282c);
  static const lightInputFieldFocusBackgroundColor = Color(0xffebfbfa);
}

// Color Schemes
class AppColorScheme {
  static const lightColorScheme = ColorScheme.light(
    primary: AppColors.cyan,
    onPrimaryContainer: AppColors.white,
    inverseSurface: AppColors.lightButtonColor,
    onInverseSurface: AppColors.lightButtonForegroundColor,
    onSecondaryContainer: AppColors.lightInputFieldFocusBackgroundColor,
    onTertiaryFixed: Color(0xffcff6f3),
    onTertiaryFixedVariant: Color(0xfff6fcfc),
  );
  static const darkColorScheme = ColorScheme.dark(
    primary: AppColors.cyan,
    onPrimaryContainer: AppColors.tileBackgroundColor,
    inverseSurface: AppColors.darkButtonColor,
    onInverseSurface: AppColors.darkButtonForegroundColor,
    onSecondaryContainer: AppColors.darkButtonColor,
    onTertiaryFixed: Color(0xff143c3e),
    onTertiaryFixedVariant: Color(0xff191e24),
  );
}
