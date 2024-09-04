import 'package:ai_chat_bot/core/core.dart';

class AppInputDecorationTheme {
  static const _borderRadius = 10.0 , _opacity = 0.1;
  static final textFieldInputDecoration = InputDecorationTheme(
    // Borders Decoration
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        _borderRadius,
      ),
      borderSide: const BorderSide(
        color: AppColors.cyan,
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        _borderRadius,
      ),
      borderSide: const BorderSide(
        color: AppColors.transparent,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        _borderRadius,
      ),
      borderSide: const BorderSide(
        color: AppColors.transparent,
      ),
    ),
    outlineBorder: const BorderSide(
      color: AppColors.cyan,
    ),
    // Icons Decoration
    prefixIconColor: WidgetStateColor.resolveWith(
      (states) {
        if (states.contains(WidgetState.focused)) {
          return AppColors.cyan;
        } else {
          return AppColors.grey;
        }
      },
    ),
    suffixIconColor: WidgetStateColor.resolveWith(
      (states) {
        if (states.contains(WidgetState.focused)) {
          return AppColors.cyan;
        } else {
          return AppColors.grey;
        }
      },
    ),
    // Hint Decoration
    hintStyle: WidgetStateTextStyle.resolveWith(
      (states) {
        return const TextStyle(
          color: AppColors.grey,
          fontFamily: AppTextStyleAttributes.titleFontFamily,
        );
      },
    ),    
    // Fill Color Decoration
    fillColor: WidgetStateColor.resolveWith(
      (states) {
        if (states.contains(WidgetState.focused)) {
          return AppColors.cyan.withOpacity(_opacity);
        } else {
          return AppColors.transparent;
        }
      },
    ),
    filled: true,
    
  );
}