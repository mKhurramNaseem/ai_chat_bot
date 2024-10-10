import 'package:ai_chat_bot/core/core.dart';

class AcpAppBar extends AppBar {
  AcpAppBar({super.key})
      : super(
          title: Builder(builder: (context) {
            return Text('Active Chats',
                style: Theme.of(context).textTheme.bodyLarge);
          }),
        );
}
