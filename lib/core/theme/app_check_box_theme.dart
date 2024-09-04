import 'package:ai_chat_bot/core/core.dart';

class AppCheckBoxTheme {
  static const _borderRadius = 5.0 , _width = 3.0;
  static final checkBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(_borderRadius),
    ),
    side: const BorderSide(
      color: AppColors.cyan,
      width: _width,
    ),
  );
}
