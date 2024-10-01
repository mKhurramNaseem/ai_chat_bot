import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/chat_page/widgets/cp_loading_tile.dart';

class CpChatListView extends StatelessWidget {
  final List<ChatMessage> messages;
  final bool isResponseLoading;
  const CpChatListView({
    super.key,
    required this.messages,
    required this.isResponseLoading,
  });

  @override
  Widget build(BuildContext context) {
    var scrollController = context.read<ChatScrollController>();
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      controller: context.read<ChatScrollController>(),      
      slivers: [
        SliverList.builder(
          itemCount: messages.length,
          itemBuilder: (context, index) {
            return messages[index].isSender
                ? CpSenderTile(message: messages[index])
                : CpReceiverTile(
                    chatMessage: messages[index],
                    showIcon: index > 0 ? messages[index - 1].isSender : true,
                  );
          },
        ),
        if (isResponseLoading)
          const SliverToBoxAdapter(
            child: CpLoadingTile(),
          ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: (MediaQuery.sizeOf(context).height -
                    kToolbarHeight -
                    MediaQuery.paddingOf(context).top) *
                0.1,
          ),
        ),
      ],
    );
  }
}
