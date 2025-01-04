import 'package:ai_chat_bot/core/core.dart';

class AppButtonTheme {
  static const _elevation = 10.0, _zeroElevation = 0.0 , _opacity = 0.5;
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
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if(states.contains(WidgetState.disabled)){
          return AppColors.cyan.withAlpha(50);
        }
        return AppColors.cyan;
      },),
      foregroundColor:  WidgetStateProperty.resolveWith((states) {
        if(states.contains(WidgetState.disabled)){
          return AppColors.grey;
        }
        return AppColors.white;
      },),
      elevation: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.pressed) || states.contains(WidgetState.disabled)) {
            return _zeroElevation;
          }
          return _elevation;
        },
      ),
      shadowColor: WidgetStateProperty.resolveWith((states) {
        if(states.contains(WidgetState.disabled)){
          return AppColors.transparent;
        }
        return AppColors.cyan.withOpacity(_opacity);
      },),
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
