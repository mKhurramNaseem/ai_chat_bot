import 'package:ai_chat_bot/core/core.dart';

class AppButtonTheme {
  static const _elevation = 10.0, _opacity = 0.5 , _zeroElevation = 0.0;
  static final buttonTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: const WidgetStatePropertyAll(AppColors.cyan),
      foregroundColor: const WidgetStatePropertyAll(AppColors.white),
      elevation: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.pressed)) {
            return _zeroElevation;
          }
          return _elevation;
        },
      ),
      shadowColor: WidgetStatePropertyAll(
        AppColors.cyan.withOpacity(_opacity),
      ),
      textStyle: const WidgetStatePropertyAll(
        TextStyle(
          fontFamily: AppTextStyleAttributes.titleFontFamily,
          fontWeight: AppTextStyleAttributes.titleFontWeight,
          letterSpacing: AppTextStyleAttributes.titleLetterSpacing,
        ),
      ),
    ),
  );
  static final darkButtonTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: const WidgetStatePropertyAll(AppColors.cyan),
      foregroundColor: const WidgetStatePropertyAll(AppColors.white),
      elevation: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.pressed)) {
            return _zeroElevation;
          }
          return _elevation;
        },
      ),
      shadowColor: WidgetStatePropertyAll(
        AppColors.cyan.withOpacity(_opacity),
      ),
      textStyle: const WidgetStatePropertyAll(
        TextStyle(
          fontFamily: AppTextStyleAttributes.titleFontFamily,
          fontWeight: AppTextStyleAttributes.titleFontWeight,
          letterSpacing: AppTextStyleAttributes.titleLetterSpacing,
        ),
      ),
    ),
  );
}
