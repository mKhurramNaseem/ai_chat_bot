import 'package:ai_chat_bot/core/core.dart';

class AppTabBarTheme {
  static final lightTabBarTheme = TabBarTheme(
    labelColor: AppColors.cyan,
    labelStyle: AppTextTheme.textTheme.bodyLarge,
    unselectedLabelStyle: AppTextTheme.textTheme.bodyMedium,
    unselectedLabelColor: AppColors.grey,
    indicatorSize: TabBarIndicatorSize.tab,
    dividerColor: AppColors.transparent,
  );
  static final darkTabBarTheme = TabBarTheme(
    labelColor: AppColors.cyan,
    labelStyle: AppTextTheme.textTheme.bodyLarge,
    unselectedLabelStyle: AppTextTheme.textTheme.bodyMedium,
    unselectedLabelColor: AppColors.grey,
    indicatorSize: TabBarIndicatorSize.tab,
    dividerColor: AppColors.grey    
  );
}
