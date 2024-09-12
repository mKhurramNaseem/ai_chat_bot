import 'package:ai_chat_bot/core/core.dart';

class WpAppBar extends AppBar{
  static const _padding = 10.0;
  WpAppBar({super.key}):super(
    title: Builder(
      builder: (context) {
        return Text(
              AppConstants.botName,
              style: Theme.of(context).textTheme.bodyLarge,
            );
      }
    ),
        leading: Padding(
          padding: const EdgeInsets.all(_padding),
          child: Image.asset(
            AppImages.simpleImage,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(_padding),
            child: AppIcons.activityIcon,
          ),
          Padding(
            padding: EdgeInsets.all(_padding),
            child: AppIcons.settingsIcon,
          ),
        ],
  );

}