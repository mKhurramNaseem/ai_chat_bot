import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/domain/entities/chat_params.dart';

class HpStartChatButton extends StatelessWidget {
  static const _text = 'Start Another Chat with ${AppConstants.botName}';
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
                  Navigator.of(context).pushNamed(ChatPage.pageName , arguments: ChatParams(isActive: true));
                },
                style: ButtonStyle(
                  fixedSize: WidgetStatePropertyAll(
                    Size(constraints.maxWidth,
                        height * AppConstants.btnSizePercent),
                  ),
                ),
                child: Text(AppLocalizations.of(context)?.startAnotherChatWithModel(AppConstants.botName) ?? _text),
              ),
            ),
          );
        }),
    );
  }
}