import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/domain/entities/chat_params.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/chat_page/widgets/cp_error_dialog.dart';
import 'package:ai_chat_bot/injection_container.dart';

class ChatPage extends StatelessWidget {
  static const pageName = '/chatPage';
  final ChatParams chatParams;
  const ChatPage({
    super.key,
    required this.chatParams,
  });

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
              endCurrentSessionUsecase: sl()),
        ),
        BlocProvider<ImagePickerBloc>(
          create: (context) => ImagePickerBloc(),
        ),
      ],
      child: ChatPageBody(
        chatParams: chatParams,
      ),
    );
  }
}

class ChatPageBody extends StatefulWidget {
  final ChatParams chatParams;
  const ChatPageBody({
    super.key,
    required this.chatParams,
  });

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
    final chatBloc = context.read<ChatBloc>();
    if (widget.chatParams.chatId == null) {
      chatBloc.add(StartChatMessageEvent());
    } else {
      chatBloc.add(ChatInitialEvent(chatId: widget.chatParams.chatId!));
    }
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
    final chatParams = ModalRoute.of(context)!.settings.arguments as ChatParams;
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
                  if (chatParams.isActive)
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
    } else if (state is ChatMessageEndState) {
      Navigator.of(context).pop();
    } else if (state is ChatErrorState) {
      showDialog(
        context: context,
        barrierColor: Theme.of(context).dialogTheme.barrierColor,
        builder: (context) => CpErrorDialog(message: state.message),
      );
    }
  }
}
