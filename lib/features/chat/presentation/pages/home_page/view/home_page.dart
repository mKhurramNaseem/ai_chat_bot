import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/home_page/widgets/hp_active_chats.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/home_page/widgets/hp_active_chats_tile.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/home_page/widgets/hp_app_bar.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/home_page/widgets/hp_ended_chats.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/home_page/widgets/hp_ended_chats_tile.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/home_page/widgets/hp_start_chat_button.dart';

class HomePage extends StatelessWidget {
  static const pageName = '/homePage';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HpAppBar(),
      body: const Center(
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: HpActiveChats(),
            ),
            Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 15,
              child: HpActiveChatsTile(),
            ),
            Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 8,
              child: HpEndedChats(),
            ),
            Spacer(
              flex: 2,
            ),
            Expanded(
              flex: 15,
              child: HpEndedChatsTile(),
            ),
            Spacer(
              flex: 2,
            ),
            Expanded(
              flex: 15,
              child: HpEndedChatsTile(),
            ),
            Spacer(
              flex: 2,
            ),
            Expanded(
              flex: 15,
              child: HpEndedChatsTile(),
            ),
            Spacer(
              flex: 2,
            ),
            Expanded(
              flex: 10,
              child: HpStartChatButton(),
            ),
            Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
