import 'package:ai_chat_bot/core/core.dart';

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
  static final darkTopBarTheme = AppBarTheme(
    backgroundColor: AppColors.transparent,
    scrolledUnderElevation: 0.0,

    /// Title text style taken from text theme defined in [app_text_theme]
    titleTextStyle: AppTextTheme.textTheme.bodyLarge,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,            
      statusBarColor: AppColors.black,
    ),
  );
}
