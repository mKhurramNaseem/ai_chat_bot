import 'package:ai_chat_bot/core/core.dart';

class CnppAppBar extends AppBar {
  CnppAppBar({super.key})
      : super(
          title: Builder(
            builder: (context) {
              return Text(
                'Create New PIN',
                style: Theme.of(context).textTheme.bodyLarge,
              );
            },
          ),
          actions: [
            Builder(
              builder: (context) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed(SetFingerPrintPage.pageName);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Skip'),
                  ),
                );
              }
            ),
          ],
        );
}
