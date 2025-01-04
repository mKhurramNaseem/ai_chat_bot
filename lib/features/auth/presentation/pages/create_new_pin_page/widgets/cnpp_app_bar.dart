import 'package:ai_chat_bot/core/core.dart';

class CnppAppBar extends AppBar {
  CnppAppBar({super.key})
      : super(
          title: Builder(
            builder: (context) {
              return Text(
                'Verify Email',
                style: Theme.of(context).textTheme.bodyLarge,
              );
            },
          ),          
        );
}
