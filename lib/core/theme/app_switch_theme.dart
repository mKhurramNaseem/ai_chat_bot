import 'package:ai_chat_bot/core/core.dart';

class AppSwitchTheme {
  static final darkSwitchTheme = SwitchThemeData(
    thumbColor: const WidgetStatePropertyAll(AppColors.white),
    trackOutlineColor: WidgetStateProperty.resolveWith(
      (states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.cyan;
        }
        return AppColors.chatBoxColor;
      },
    ),
    trackColor: WidgetStateProperty.resolveWith(
      (states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.cyan;
        }
        return AppColors.chatBoxColor;
      },
    ),
  );
  static final lightSwitchTheme = SwitchThemeData(
    thumbColor: const WidgetStatePropertyAll(AppColors.white),
    trackOutlineColor: WidgetStateProperty.resolveWith(
      (states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.cyan;
        }
        return AppColors.grey;
      },
    ),
    trackColor: WidgetStateProperty.resolveWith(
      (states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.cyan;
        }
        return AppColors.grey;
      },
    ),
  );
}
