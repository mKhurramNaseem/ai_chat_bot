import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/presentation/bloc/active_chats_bloc/active_chats_bloc.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/active_chats_page/widgets/acp_app_bar.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/active_chats_page/widgets/acp_tile.dart';
import 'package:ai_chat_bot/injection_container.dart';

class ActiveChatsPage extends StatelessWidget {
  static const pageName = '/activeChatsPage';
  const ActiveChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ActiveChatsBloc>(
      create: (context) => ActiveChatsBloc(activeChatsUsecase: sl(),deleteChatUsecase: sl(),),
      child: const ActiveChatsPageBody(),
    );
  }
}

class ActiveChatsPageBody extends StatefulWidget {
  const ActiveChatsPageBody({super.key});

  @override
  State<ActiveChatsPageBody> createState() => _ActiveChatsPageBodyState();
}

class _ActiveChatsPageBodyState extends State<ActiveChatsPageBody> {
  @override
  void initState() {
    super.initState();
    context.read<ActiveChatsBloc>().add(ActiveChatsFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AcpAppBar(),
      body: Center(
        child:
            BlocBuilder<ActiveChatsBloc, ActiveChatsState>(builder: (context, state) {
          if (state is ActiveChatsDoneState) {
            return ListView.builder(
              itemCount: state.activeChats.length,
              itemBuilder: (context, index) {
                return AcpListTile(
                  chat: state.activeChats[index],
                );
              },
            );
          } else if (state is ActiveChatsEmptyState) {
            return const SizedBox();
          }
          return const SizedBox();
        }),
      ),
    );
  }
}