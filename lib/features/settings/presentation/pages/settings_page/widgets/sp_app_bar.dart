import 'package:ai_chat_bot/core/core.dart';

class SpAppBar extends AppBar {
  static const _title = 'Settings';
  SpAppBar({super.key})
      : super(
          title: Builder(
            builder: (context) {
              return Text(
                AppLocalizations.of(context)?.settings ?? _title,
                style: Theme.of(context).textTheme.bodyLarge,
              );
            },
          ),
        );
}
