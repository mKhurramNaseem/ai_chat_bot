import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/presentation/bloc/active_chats_bloc/active_chats_bloc.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/active_chats_page/view/active_chats_page.dart';

class HpActiveChats extends StatelessWidget {
  static const _activeText = 'Active Chats';
  static const _seeAllText = 'See All';
  static const _fontSizePercent = 0.3, _secondaryFontSize = 0.25;
  const HpActiveChats({super.key});

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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocBuilder<ActiveChatsBloc, ActiveChatsState>(
                    builder: (context, state) {
                  var text = _seeAllText;
                  if (state is ActiveChatsEmptyState) {
                    text = '';
                  }
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(ActiveChatsPage.pageName);
                    },
                    child: Text(
                      text,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: AppColors.cyan,
                            fontSize:
                                constraints.maxHeight * _secondaryFontSize,
                          ),
                    ),
                  );
                }),
              ),
            ],
          );
        },
      ),
    );
  }
}
