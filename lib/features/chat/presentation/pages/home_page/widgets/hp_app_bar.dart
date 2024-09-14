import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/activity_page/view/activity_page.dart';

class HpAppBar extends AppBar {
  static const _padding = 10.0;
  HpAppBar({super.key})
      : super(
          title: Builder(builder: (context) {
            return Text(
              AppConstants.botName,
              style: Theme.of(context).textTheme.bodyLarge,
            );
          }),
          leading: Padding(
            padding: const EdgeInsets.all(_padding),
            child: Image.asset(
              AppImages.simpleImage,
            ),
          ),
          actions: [
            Builder(builder: (context) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(ActivityPage.pageName);
                },
                child: const Padding(
                  padding: EdgeInsets.all(_padding),
                  child: AppIcons.activityIcon,
                ),
              );
            }),
            const Padding(
              padding: EdgeInsets.all(_padding),
              child: AppIcons.settingsIcon,
            ),
          ],
        );
}
