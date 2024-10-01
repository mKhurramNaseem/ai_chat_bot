import 'package:ai_chat_bot/core/core.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class CpReceiverTile extends StatelessWidget {
  static const _specificRadius = 6.0;
  final ChatMessage chatMessage;
  final bool showIcon;
  const CpReceiverTile({
    super.key,
    required this.showIcon,
    required this.chatMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Flexible(
            flex: 70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (showIcon)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: LayoutBuilder(builder: (context, constraints) {
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                            width: constraints.maxWidth * 0.45,
                            child: Image.asset(AppImages.starImage)),
                      );
                    }),
                  ),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.elliptical(17, 20),
                      bottomLeft: Radius.elliptical(17, 20),
                      topLeft: Radius.circular(_specificRadius),
                      topRight: Radius.elliptical(17, 20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: MarkdownBody(
                      data: chatMessage.message,
                      fitContent: true,
                      selectable: true,
                      styleSheet: MarkdownStyleSheet.fromTheme(
                        Theme.of(context),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(
            flex: 30,
          ),
        ],
      ),
    );
  }
}
