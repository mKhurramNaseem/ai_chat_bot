import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/ended_chats_page/widgets/ecp_app_bar.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/ended_chats_page/widgets/ecp_list_tile.dart';

class EndedChatsPage extends StatelessWidget {
  static const pageName = '/endedChatPage';
  const EndedChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EcpAppBar(),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return const EcpListTile();
          },
        ),
      ),
    );
  }
}
