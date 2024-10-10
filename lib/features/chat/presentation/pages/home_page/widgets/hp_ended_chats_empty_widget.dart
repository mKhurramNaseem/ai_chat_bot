import 'package:ai_chat_bot/core/core.dart';

class HpEndedChatsEmptyWidget extends StatelessWidget {
  static const _fontSizePercent = 0.2;
  const HpEndedChatsEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return HpBaseWidget(
      child: Column(
        children: [
          const Spacer(
            flex: 10,
          ),
          Expanded(flex: 50, child: Image.asset(AppImages.crossEyedImage)),
          const Spacer(
            flex: 5,
          ),
          Expanded(
              flex: 30,
              child: LayoutBuilder(builder: (context, constraints) {
                return Text(
                  'No Ended Chats',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: constraints.maxHeight * _fontSizePercent,
                      ),
                );
              })),
          const Spacer(
            flex: 5,
          ),
        ],
      ),
    );
  }
}
