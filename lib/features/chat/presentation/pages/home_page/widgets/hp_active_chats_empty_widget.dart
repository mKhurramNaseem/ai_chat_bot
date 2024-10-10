import 'package:ai_chat_bot/core/core.dart';

class HpActiveChatsEmptyWidget extends StatelessWidget {
  static const _fontSizePercent = 0.2;
  const HpActiveChatsEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return HpBaseWidget(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Expanded(child: Image.asset(AppImages.crossEyedImage)),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Text(
                    'No Active Chats',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: constraints.maxHeight * _fontSizePercent,
                        ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
