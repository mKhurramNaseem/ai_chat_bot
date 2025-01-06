import 'package:ai_chat_bot/core/core.dart';

class AapAppBar extends AppBar {
  static const _text = 'Details Chat Activity';
  AapAppBar({super.key})
      : super(
          title: Builder(
            builder: (context) {
              return Text(
                AppLocalizations.of(context)?.detailsChatActivity ?? _text,
                style: Theme.of(context).textTheme.bodyLarge,
              );
            },
          ),
        );
}
