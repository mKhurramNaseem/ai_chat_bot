import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/domain/entities/chat.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/home_page/widgets/hp_ended_chats_tile.dart';

class HpEndedChats extends StatelessWidget {
  final List<Chat> chats;
  const HpEndedChats({
    super.key,
    required this.chats,
  });

  @override
  Widget build(BuildContext context) {    
    return Column(
      children: [
        for (int i = 0; i < 3; i++)
          Builder(
            builder: (context) {
              if (i < chats.length) {
                return Expanded(
                  child: HpEndedChatsTile(
                    chat: chats[i],
                  ),
                );
              }
              return const Expanded(
                child: SizedBox(),
              );
            },
          ),
      ],
    );
  }
}
