import 'package:ai_chat_bot/core/core.dart';

class CnpAppBar extends AppBar {
  static const _title = 'Create New PIN';
  CnpAppBar({super.key})
      : super(
          title: Builder(
            builder: (context) {
              return Text(
                _title,
                style: Theme.of(context).textTheme.bodyLarge,
              );
            },
          ),
        );
}
