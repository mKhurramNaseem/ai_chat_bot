import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/ended_chats_page/view/ended_chats_page.dart';

class HpEndedChats extends StatelessWidget {
  static const _activeText = 'Ended Chats';
  static const _seeAllText = 'See All';
  static const _fontSizePercent = 0.3, _secondaryFontSize = 0.25;
  const HpEndedChats({super.key});

  @override
  Widget build(BuildContext context) {
    return HpBaseWidget(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                _activeText,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: constraints.maxHeight * _fontSizePercent,
                    ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(EndedChatsPage.pageName);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _seeAllText,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.cyan,
                          fontSize: constraints.maxHeight * _secondaryFontSize,
                        ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
