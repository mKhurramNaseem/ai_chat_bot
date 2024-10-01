
import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/injection_container.dart';

class ChatPage extends StatelessWidget {
  static const pageName = '/chatPage';
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ChatBloc>(
          create: (context) => ChatBloc(
            getUpdatedChatUsecase: sl(),
            sendMessageUsecase: sl(),
            startChatUsecase: sl(),
            getPreviousChatUsecase: sl(),
          ),
        ),
        BlocProvider<ImagePickerBloc>(
          create: (context) => ImagePickerBloc(),
        ),
      ],
      child: const ChatPageBody(),
    );
  }
}

class ChatPageBody extends StatefulWidget {
  const ChatPageBody({super.key});

  @override
  State<ChatPageBody> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPageBody> {
  late ChatScrollController scrollController;
  late ChatTextEditingController chatTextController;
  late AudioPlayer player;
  var times = 2;

  @override
  void initState() {
    super.initState();
    scrollController = ChatScrollController();
    chatTextController = ChatTextEditingController();
    player = AudioPlayer();
    initialize();
  }

  initialize() async {
    await player.setAudioSource(
      AudioSource.asset(
        'assets/audios/send_message_sound.mp3',
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final chatBloc = context.read<ChatBloc>();
    final chatId = ModalRoute.of(context)!.settings.arguments as int?;
    if (chatId == null) {
      chatBloc.add(StartChatMessageEvent());
    } else {
      chatBloc.add(ChatInitialEvent(chatId: chatId));
    }
  }

  @override
  void dispose() {
    chatTextController.dispose();
    scrollController.dispose();
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQuery.viewInsetsOf(context).bottom > 0;
    return MultiProvider(
      providers: [
        ListenableProvider<ChatTextEditingController>(
          create: (context) => chatTextController,
        ),
        ListenableProvider<ChatScrollController>(
          create: (context) => scrollController,
        ),
        Provider<AudioPlayer>(
          create: (context) => player,
        )
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<ChatBloc, ChatState>(listener: _chatBlocStateListener),
          BlocListener<ImagePickerBloc, ImagePickerState>(
              listener: _imagePickerBlocListener),
        ],
        child: Scaffold(
          appBar: CpAppBar(),
          body: Center(
            child: CpBaseWidget(
              child: Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: BlocBuilder<ChatBloc, ChatState>(
                            builder: (context, state) {
                          // SchedulerBinding.instance.addPostFrameCallback(
                          //   (timeStamp) {
                          //     if (state is ChatUpdateState) {
                          //       if (!state.isSender) {
                          //         return;
                          //       }
                          //     }
                          //     if (scrollController.hasClients) {
                          //       scrollController.jumpTo(
                          //           scrollController.position.maxScrollExtent *
                          //               times);
                          //       times = 1;
                          //     }
                          //   },
                          // );
                          return CpChatListView(
                            messages: state.messages,
                            isResponseLoading:
                                state is ChatResponseLoadingState,
                          );
                        }),
                      ),
                    ],
                  ),
                  const Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: CpChatField(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _imagePickerBlocListener(BuildContext context, state) {
    if (state is ImagePickerDoneState) {
      var chatBloc = context.read<ChatBloc>();
      FocusManager.instance.primaryFocus?.unfocus();
      var futureOfEditScreen = Navigator.of(context)
          .pushNamed(ImageEditPage.pageName, arguments: state.image);
      futureOfEditScreen.then(
        (value) {
          if (value != null) {
            chatBloc.add(ChatSendMessageEvent(message: value as ChatMessage));
          }
        },
      );
    }
  }

  void _chatBlocStateListener(BuildContext context, ChatState state) {
    if (state is ChatUpdateState) {
      if (state.isSender) {
        player.seek(Duration.zero);
        player.play();
        context.read<ChatTextEditingController>().clear();
      }
    }
  }
}
