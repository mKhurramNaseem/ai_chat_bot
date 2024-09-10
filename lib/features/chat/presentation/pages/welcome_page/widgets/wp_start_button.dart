import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/home_page/view/home_page.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/welcome_page/widgets/wp_base_widget.dart';

class WpStartButton extends StatelessWidget {
  static const _text = 'Start Chat with Bobo';
  const WpStartButton({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return WpBaseWidget(
      child: LayoutBuilder(builder: (context, constraints) {
          return SizedBox(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(HomePage.pageName);
                },
                style: ButtonStyle(
                  fixedSize: WidgetStatePropertyAll(
                    Size(constraints.maxWidth,
                        height * AppConstants.btnSizePercent),
                  ),
                ),
                child: const Text(_text),
              ),
            ),
          );
        }),
    );
  }
}