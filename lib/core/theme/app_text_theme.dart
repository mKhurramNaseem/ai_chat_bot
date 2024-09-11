import 'package:ai_chat_bot/core/core.dart';

class AppTextStyleAttributes {
  static const titleFontFamily = 'Urbanist';
  static const titleFontWeight = FontWeight.w700;
  static const titleLetterSpacing = 1.0;
}

class AppTextTheme {
  static const textTheme = TextTheme(
    /// Body Large => Used in Titles of [create_account_page]
    bodyLarge: TextStyle(
      fontFamily: AppTextStyleAttributes.titleFontFamily,
      fontWeight: AppTextStyleAttributes.titleFontWeight,
      letterSpacing: AppTextStyleAttributes.titleLetterSpacing,
      color: AppColors.black,
    ),

    /// Body Medium => Used by app bar theme in [app_bar_theme]
    bodyMedium: TextStyle(
      fontFamily: AppTextStyleAttributes.titleFontFamily,
      fontWeight: AppTextStyleAttributes.titleFontWeight,
      letterSpacing: AppTextStyleAttributes.titleLetterSpacing,
      color: AppColors.grey,
    ),

    /// Input Fields text style => Used by Input Fields in [create_account_page]
    bodySmall: TextStyle(
      fontFamily: AppTextStyleAttributes.titleFontFamily,
      fontWeight: AppTextStyleAttributes.titleFontWeight,
      color: AppColors.black,
    ),
    labelLarge: TextStyle(
      fontFamily: AppTextStyleAttributes.titleFontFamily,
      fontWeight: AppTextStyleAttributes.titleFontWeight,
      color: AppColors.grey,
    ),
    headlineSmall: TextStyle(
      fontFamily: AppTextStyleAttributes.titleFontFamily,
      fontWeight: AppTextStyleAttributes.titleFontWeight,
      letterSpacing: AppTextStyleAttributes.titleLetterSpacing,
      color: AppColors.black,
    ),
  );
  static const darkTextTheme = TextTheme(
    /// Body Large => Used in Titles of [create_account_page]
    bodyLarge: TextStyle(
      fontFamily: AppTextStyleAttributes.titleFontFamily,
      fontWeight: AppTextStyleAttributes.titleFontWeight,
      letterSpacing: AppTextStyleAttributes.titleLetterSpacing,
      color: AppColors.white,
    ),

    /// Body Medium => Used by app bar theme in [app_bar_theme]
    bodyMedium: TextStyle(
      fontFamily: AppTextStyleAttributes.titleFontFamily,
      fontWeight: AppTextStyleAttributes.titleFontWeight,
      letterSpacing: AppTextStyleAttributes.titleLetterSpacing,
      color: AppColors.grey,
    ),

    /// Input Fields text style => Used by Input Fields in [create_account_page]
    bodySmall: TextStyle(
      fontFamily: AppTextStyleAttributes.titleFontFamily,
      fontWeight: AppTextStyleAttributes.titleFontWeight,
      color: AppColors.white,
    ),
    labelLarge: TextStyle(
      fontFamily: AppTextStyleAttributes.titleFontFamily,
      fontWeight: AppTextStyleAttributes.titleFontWeight,
      color: AppColors.white,
    ),
    headlineLarge: TextStyle(
      fontFamily: AppTextStyleAttributes.titleFontFamily,
      fontWeight: AppTextStyleAttributes.titleFontWeight,
      letterSpacing: AppTextStyleAttributes.titleLetterSpacing,
      color: AppColors.cyan,
    ),
    headlineSmall: TextStyle(
      fontFamily: AppTextStyleAttributes.titleFontFamily,
      fontWeight: AppTextStyleAttributes.titleFontWeight,
      letterSpacing: AppTextStyleAttributes.titleLetterSpacing,
      color: AppColors.cyan,
    ),
  );
}
