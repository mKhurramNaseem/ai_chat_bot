import 'package:ai_chat_bot/core/core.dart';

class AppInputDecorationTheme {
  static const _borderRadius = 10.0;
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
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        _borderRadius,
      ),
      borderSide: const BorderSide(color: AppColors.red),
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
    errorStyle: WidgetStateTextStyle.resolveWith(
      (states) {
        return const TextStyle(
          color: AppColors.red,
          fontFamily: AppTextStyleAttributes.titleFontFamily,
        );
      },
    ),
    helperStyle: WidgetStateTextStyle.resolveWith(
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
          return AppColors.lightInputFieldFocusBackgroundColor;
        } else {
          return AppColors.transparent;
        }
      },
    ),
    filled: true,
  );

  static final darkTextFieldInputDecoration = InputDecorationTheme(
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
        color: AppColors.tileBackgroundColor,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        _borderRadius,
      ),
      borderSide: const BorderSide(
        color: AppColors.tileBackgroundColor,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        _borderRadius,
      ),
      borderSide: const BorderSide(color: AppColors.red),
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
    errorStyle: WidgetStateTextStyle.resolveWith(
      (states) {
        return const TextStyle(
          color: AppColors.red,
          fontFamily: AppTextStyleAttributes.titleFontFamily,
        );
      },
    ),
    helperStyle: WidgetStateTextStyle.resolveWith(
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
          return AppColors.darkInputFieldFocusBackgroundColor;
        } else {
          return AppColors.tileBackgroundColor;
        }
      },
    ),
    filled: true,
  );
}
