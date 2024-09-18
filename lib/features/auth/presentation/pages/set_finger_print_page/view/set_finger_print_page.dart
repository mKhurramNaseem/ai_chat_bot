import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/auth/presentation/pages/set_finger_print_page/widgets/sfa_button_row.dart';
import 'package:ai_chat_bot/features/auth/presentation/pages/set_finger_print_page/widgets/sfp_app_bar.dart';
import 'package:ai_chat_bot/features/auth/presentation/pages/set_finger_print_page/widgets/sfp_text.dart';

class SetFingerPrintPage extends StatelessWidget {
  static const pageName = '/setFingerPrintPage';
  const SetFingerPrintPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SfpAppBar(),
      body: Center(
        child: Column(
          children: [
            const Spacer(
              flex: 10,
            ),
            const Expanded(
              flex: 7,
              child: SfpText(),
            ),
            const Spacer(
              flex: 10,
            ),
            Expanded(
              flex: 40,
              child: Center(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Icon(
                      Icons.fingerprint,
                      color: Theme.of(context).colorScheme.primary,
                      size: constraints.maxHeight,
                    );
                  },
                ),
              ),
            ),
            const Expanded(
              flex: 30,
              child: SfaButtonRow(),
            ),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
