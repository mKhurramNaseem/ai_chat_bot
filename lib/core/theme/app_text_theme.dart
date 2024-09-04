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
    ),    
    /// Body Medium => Used by app bar theme in [app_bar_theme]
    bodyMedium: TextStyle(
      fontFamily: AppTextStyleAttributes.titleFontFamily,
      fontWeight: AppTextStyleAttributes.titleFontWeight,
      letterSpacing: AppTextStyleAttributes.titleLetterSpacing,
    ),
    /// Input Fields text style => Used by Input Fields in [create_account_page]
    bodySmall: TextStyle(
      fontFamily: AppTextStyleAttributes.titleFontFamily,
      fontWeight: AppTextStyleAttributes.titleFontWeight,      
    ),    
  );
}
