import 'package:ai_chat_bot/core/theme/app_bar_theme.dart';
import 'package:ai_chat_bot/core/theme/app_button_theme.dart';
import 'package:ai_chat_bot/core/theme/app_check_box_theme.dart';
import 'package:ai_chat_bot/core/theme/app_input_decoration_theme.dart';
import 'package:ai_chat_bot/core/theme/app_text_theme.dart';
import 'package:ai_chat_bot/core/theme/app_color_scheme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  // Light Theme
  static final lightTheme = ThemeData(
    // Color Scheme
    colorScheme: AppColorScheme.lightColorScheme,
    /// Elevated Button => Main Button used on [create_account_page]
    elevatedButtonTheme: AppButtonTheme.buttonTheme,
    // Text Theme
    textTheme: AppTextTheme.textTheme,
    // App Bar Theme
    appBarTheme: MyAppBarTheme.topBarTheme,
    /// Text Fields Theme => Used on [create_account_page]
    inputDecorationTheme: AppInputDecorationTheme.textFieldInputDecoration,
    /// Check Box Theme => Used on [create_account_page]
    checkboxTheme: AppCheckBoxTheme.checkBoxTheme,
  );
  // Dark Theme
  static final darkTheme = ThemeData(
    colorScheme: AppColorScheme.darkColorScheme,
  );
}
