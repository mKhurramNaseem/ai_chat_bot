import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/presentation/bloc/end_chats_bloc/end_chats_bloc.dart';

class HpEndedChatsText extends StatelessWidget {
  static const _activeText = 'Ended Chats';
  static const _seeAllText = 'See All';
  static const _fontSizePercent = 0.3, _secondaryFontSize = 0.25;
  const HpEndedChatsText({super.key});

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
                AppLocalizations.of(context)?.endedChats ?? _activeText,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: constraints.maxHeight * _fontSizePercent,
                    ),
              ),
              BlocBuilder<EndChatsBloc, EndChatsState>(
                  builder: (context, state) {
                var text = _seeAllText;
                if (state is EndChatsEmptyState) {
                  text = '';
                }
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(EndedChatsPage.pageName);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      AppLocalizations.of(context)?.seeAll ?? text,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: AppColors.cyan,
                            fontSize:
                                constraints.maxHeight * _secondaryFontSize,
                          ),
                    ),
                  ),
                );
              }),
            ],
          );
        },
      ),
    );
  }
}
