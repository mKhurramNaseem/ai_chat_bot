import 'package:ai_chat_bot/core/core.dart';
import 'package:flutter/services.dart';

class MyAppBarTheme {
  static final topBarTheme = AppBarTheme(
    backgroundColor: AppColors.transparent,
    scrolledUnderElevation: 0.0,

    /// Title text style taken from text theme defined in [app_text_theme]
    titleTextStyle: AppTextTheme.textTheme.bodyMedium,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      // statusBarColor: AppColors.white,
    ),
  );
}
