import 'package:ai_chat_bot/core/core.dart';
import 'package:flutter/services.dart';

class MyAppBarTheme {
  static final topBarTheme = AppBarTheme(
    backgroundColor: AppColors.transparent,
    scrolledUnderElevation: 0.0,

    /// Title text style taken from text theme defined in [app_text_theme]
    titleTextStyle: AppTextTheme.textTheme.bodyLarge,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,            
      statusBarColor: AppColors.white,
    ),
  );
}
