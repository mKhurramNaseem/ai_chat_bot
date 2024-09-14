import 'package:ai_chat_bot/core/core.dart';

class ApAppBar extends AppBar {
  static const _titleText = 'Activity';
  ApAppBar({super.key})
      : super(
          title: Builder(
            builder: (context) {
              return Text(
                _titleText,
                style: Theme.of(context).textTheme.bodyLarge,
              );
            },
          ),
          actions: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: AppIcons.moreIcon,
            ),
          ],
        );
}
