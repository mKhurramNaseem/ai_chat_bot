import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/chat_page/widgets/cp_loading_tile.dart';

class CpChatListView extends StatelessWidget {
  final List<ChatMessage> messages;
  final bool isResponseLoading;
  final bool isActive;
  final ChatScrollController scrollController;
  const CpChatListView({
    super.key,
    required this.messages,
    required this.isResponseLoading,
    required this.isActive,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      reverse: true,
      controller: scrollController,
      slivers: [
        if (isActive)
          SliverToBoxAdapter(
            child: SizedBox(
              height: (MediaQuery.sizeOf(context).height -
                      kToolbarHeight -
                      MediaQuery.paddingOf(context).top) *
                  0.1,
            ),
          ),
        if (isResponseLoading)
          const SliverToBoxAdapter(
            child: CpLoadingTile(),
          ),
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
      ],
    );
  }
}
