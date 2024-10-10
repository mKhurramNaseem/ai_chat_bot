import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/presentation/bloc/active_chats_bloc/active_chats_bloc.dart';
import 'package:ai_chat_bot/features/chat/presentation/bloc/end_chats_bloc/end_chats_bloc.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/home_page/widgets/hp_active_chats_empty_widget.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/home_page/widgets/hp_active_chats_text.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/home_page/widgets/hp_active_chats_tile.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/home_page/widgets/hp_app_bar.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/home_page/widgets/hp_ended_chats.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/home_page/widgets/hp_ended_chats_empty_widget.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/home_page/widgets/hp_ended_chats_text.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/home_page/widgets/hp_start_chat_button.dart';
import 'package:ai_chat_bot/injection_container.dart';
import 'package:ai_chat_bot/main.dart';

class HomePage extends StatelessWidget {
  static const pageName = '/homePage';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ActiveChatsBloc>(
        create: (context) => ActiveChatsBloc(activeChatsUsecase: sl(),deleteChatUsecase: sl(),),
        ),
        BlocProvider<EndChatsBloc>(
          create: (context) => EndChatsBloc(
            getEndedChatsUsecase: sl(),
            deleteChatUsecase: sl(),
          ),
        ),
      ],
      child: const HomePageBody(),
    );
  }
}

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageBody> with RouteAware {
  @override
  void initState() {
    super.initState();
    hpNavigatorObserver.subscribe(this);
    context.read<ActiveChatsBloc>().add(ActiveChatsFetchEvent());
    context.read<EndChatsBloc>().add(EndChatsFetchEvent());
  }

  @override
  void dispose() {
    hpNavigatorObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPop() {
    context.read<ActiveChatsBloc>().add(ActiveChatsFetchEvent());
    context.read<EndChatsBloc>().add(EndChatsFetchEvent());
    super.didPop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HpAppBar(),
      body: Center(
        child: Column(
          children: [
            const Expanded(
              flex: 8,
              child: HpActiveChats(),
            ),
            const Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 15,
              child: BlocBuilder<ActiveChatsBloc, ActiveChatsState>(
                  builder: (context, state) {
                if (state is ActiveChatsDoneState) {
                  return HpActiveChatsTile(
                    chat: state.activeChats[0],
                  );
                } else if (state is ActiveChatsEmptyState) {
                  return const HpActiveChatsEmptyWidget();
                }
                return const SizedBox();
              }),
            ),
            const Spacer(
              flex: 1,
            ),
            const Expanded(
              flex: 8,
              child: HpEndedChatsText(),
            ),
            const Spacer(
              flex: 2,
            ),
            Expanded(
              flex: 51,
              child: BlocBuilder<EndChatsBloc, EndChatsState>(
                  builder: (context, state) {
                if (state is EndChatsDoneState) {
                  return HpEndedChats(
                    chats: state.endedChats,
                  );
                } else if (state is EndChatsEmptyState) {
                  return const HpEndedChatsEmptyWidget();
                }
                return const SizedBox();
              }),
            ),
            const Expanded(
              flex: 10,
              child: HpStartChatButton(),
            ),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
