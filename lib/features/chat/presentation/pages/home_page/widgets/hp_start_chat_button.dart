import 'package:ai_chat_bot/core/core.dart';

class HpStartChatButton extends StatelessWidget {
  static const _text = 'Start Another Chat with Bobo';
  const HpStartChatButton({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return HpBaseWidget(
      child: LayoutBuilder(builder: (context, constraints) {
          return SizedBox(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  
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