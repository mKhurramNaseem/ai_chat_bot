import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/presentation/bloc/end_chats_bloc/end_chats_bloc.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/ended_chats_page/widgets/ecp_app_bar.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/ended_chats_page/widgets/ecp_list_tile.dart';
import 'package:ai_chat_bot/injection_container.dart';

class EndedChatsPage extends StatelessWidget {
  static const pageName = '/endedChatPage';
  const EndedChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EndChatsBloc>(
      create: (context) => EndChatsBloc(getEndedChatsUsecase: sl(),deleteChatUsecase: sl()),
      child: const EndedChatsPageBody(),
    );
  }
}

class EndedChatsPageBody extends StatefulWidget {
  const EndedChatsPageBody({super.key});

  @override
  State<EndedChatsPageBody> createState() => _EndedChatsPageState();
}

class _EndedChatsPageState extends State<EndedChatsPageBody> {
  @override
  void initState() {
    super.initState();
    context.read<EndChatsBloc>().add(EndChatsFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EcpAppBar(),
      body: Center(
        child:
            BlocBuilder<EndChatsBloc, EndChatsState>(builder: (context, state) {
          if (state is EndChatsDoneState) {
            return ListView.builder(
              itemCount: state.endedChats.length,
              itemBuilder: (context, index) {
                return EcpListTile(
                  chat: state.endedChats[index],
                );
              },
            );
          } else if (state is EndChatsEmptyState) {
            return const SizedBox();
          }
          return const SizedBox();
        }),
      ),
    );
  }
}
