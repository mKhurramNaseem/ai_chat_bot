import 'package:ai_chat_bot/core/core.dart';
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
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: AppIcons.searchIcon,
            ),
            Builder(builder: (context) {
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
                              return const CpEndSessionDialog();
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
            }),
          ],
        );
}
