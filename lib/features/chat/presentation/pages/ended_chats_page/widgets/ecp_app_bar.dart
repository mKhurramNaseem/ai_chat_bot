import 'package:ai_chat_bot/core/core.dart';

class EcpAppBar extends AppBar {
  EcpAppBar({super.key})
      : super(
          title: Builder(builder: (context) {
            return Text(
              AppLocalizations.of(context)?.endedChats ?? 'Ended Chats',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge                  
            );
          }),
        );
}
