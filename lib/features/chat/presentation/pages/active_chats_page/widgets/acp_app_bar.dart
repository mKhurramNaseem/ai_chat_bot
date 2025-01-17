import 'package:ai_chat_bot/core/core.dart';

class AcpAppBar extends AppBar {
  AcpAppBar({super.key})
      : super(
          title: Builder(builder: (context) {
            return Text(AppLocalizations.of(context)?.activeChats ?? 'Active Chats',
                style: Theme.of(context).textTheme.bodyLarge);
          }),
        );
}
