import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/domain/entities/chat_params.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/chat_page/widgets/cp_end_session_dialog.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/chat_page/widgets/cp_menu_item.dart';

class CpAppBar extends AppBar {
  CpAppBar({super.key})
      : super(
          title: Builder(
            builder: (context) {
              return Text(
                AppConstants.botName,
                style: Theme.of(context).textTheme.bodyLarge,
              );
            },
          ),
          actions: [
            Builder(builder: (context) {
              final chatParams =
                  ModalRoute.of(context)!.settings.arguments as ChatParams;
              final chatBloc = context.read<ChatBloc>();
              if (chatParams.isActive) {
                return GestureDetector(
                  onTapDown: (details) {
                    FocusManager.instance.primaryFocus?.unfocus();
                    final screenSize = MediaQuery.of(context).size;
                    var offset = details.globalPosition;
                    double left = offset.dx;
                    double top = offset.dy;
                    double right = screenSize.width - offset.dx;
                    double bottom = screenSize.height - offset.dy;
                    showMenu(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      position: RelativeRect.fromLTRB(left, top, right, bottom),
                      items: [
                        CpMenuItem(
                          icon: AppIcons.emailFieldIcon,
                          text: 'Clear Chat',
                        ),
                        CpMenuItem(
                          icon: AppIcons.emailFieldIcon,
                          text: 'Export Chat',
                        ),
                        CpMenuItem(
                          icon: AppIcons.emailFieldIcon,
                          text: 'End Session',
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return BlocProvider.value(
                                  value: chatBloc,
                                  child: const CpEndSessionDialog(),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: AppIcons.moreIcon,
                  ),
                );
              }
              return const SizedBox();
            }),
          ],
        );
}
