import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/domain/entities/chat.dart';
import 'package:ai_chat_bot/features/chat/domain/entities/chat_params.dart';

class HpEndedChatsTile extends StatelessWidget {
  static const _startSpace = 5,
      _middleSpace = 3,
      _tileTextsFlex = 57,
      _imageFlex = 30;
  final Chat chat;
  const HpEndedChatsTile({
    super.key,
    required this.chat,
  });

  @override
  Widget build(BuildContext context) {
    return HpBaseWidget(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(ChatPage.pageName, arguments: ChatParams(isActive: false,chatId: chat.chatId));
          },
          child: Container(
            decoration: ShapeDecoration(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                ),
                color: Theme.of(context).colorScheme.onPrimaryContainer),
            child: Row(
              children: [
                const Spacer(
                  flex: _startSpace,
                ),
                Expanded(
                  flex: _imageFlex,
                  child: Image.asset(
                    AppImages.simpleImage,
                  ),
                ),
                const Spacer(
                  flex: _middleSpace,
                ),
                Expanded(
                  flex: _tileTextsFlex,
                  child: HpEndedChatsTileTexts(
                    endDate: chat.endTime,
                    message: chat.lastMessage,
                  ),
                ),
                const Spacer(
                  flex: _startSpace,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HpEndedChatsTileTexts extends StatelessWidget {
  static const _titleTextFlex = 47, _spacer = 3, _messageFlex = 50;
  static const _titleFontSize = 0.32, _messageFontSize = 0.22;
  static const _title = AppConstants.botName;
  static const _maxLines = 2;
  final String message;
  final DateTime endDate;
  const HpEndedChatsTileTexts(
      {super.key, required this.message, required this.endDate});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: _titleTextFlex,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  '$_title-${endDate.month} ${endDate.day}, ${endDate.year}',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: constraints.maxHeight * _titleFontSize,
                      ),
                ),
              );
            },
          ),
        ),
        const Spacer(
          flex: _spacer,
        ),
        Expanded(
          flex: _messageFlex,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Align(
                alignment: Alignment.topLeft,
                child: Text(
                  message,
                  maxLines: _maxLines,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: constraints.maxHeight * _messageFontSize,
                      ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
