import 'dart:developer';
import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/domain/entities/chat.dart';
import 'package:ai_chat_bot/features/chat/domain/entities/chat_params.dart';

class HpActiveChatsTile extends StatelessWidget {
  static const _startSpace = 5,
      _middleSpace = 3,
      _tileTextsFlex = 44,
      _imageFlex = 30,
      _iconFlex = 10;
  final Chat chat;
  const HpActiveChatsTile({
    super.key,
    required this.chat,
  });

  @override
  Widget build(BuildContext context) {
    return HpBaseWidget(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(ChatPage.pageName, arguments: ChatParams(chatId: chat.chatId,isActive: true,));
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
                child: HpActiveChatsTileTexts(
                  text: chat.lastMessage,
                ),
              ),
              const Spacer(
                flex: _middleSpace,
              ),
              const Expanded(
                flex: _iconFlex,
                child: Icon(
                  Icons.chat_rounded,
                  color: AppColors.cyan,
                ),
              ),
              const Spacer(
                flex: _startSpace,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HpActiveChatsTileTexts extends StatelessWidget {
  static const _titleTextFlex = 47, _spacer = 3, _messageFlex = 50;
  static const _titleFontSize = 0.32, _messageFontSize = 0.22;
  static const _maxLines = 2;
  final String text;
  const HpActiveChatsTileTexts({
    super.key,
    required this.text,
  });

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
                  AppConstants.botName,
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
              log(text);
              return Align(
                alignment: Alignment.topLeft,
                child: Text(
                  text,
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
