import 'dart:developer';

import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/domain/entities/chat_params.dart';
import 'package:ai_chat_bot/features/chat/presentation/bloc/end_chats_bloc/end_chats_bloc.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/chat_page/widgets/cp_error_dialog.dart';
import 'package:ai_chat_bot/injection_container.dart';

const _fileName = 'chat_page.dart';

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
            createChatUsecase: sl(),
            getPreviousChatUsecase: sl(),
            endCurrentSessionUsecase: sl(),
            clearChatUsecase: sl(),
            startChatUsecase: sl(),
          ),
        ),
        BlocProvider<ImagePickerBloc>(
          create: (context) => ImagePickerBloc(
            pickImageUsecase: sl(),
          ),
        ),
        BlocProvider<EndChatsBloc>(
          create: (context) => EndChatsBloc(
            getEndedChatsUsecase: sl(),
            deleteChatUsecase: sl(),
          ),
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
  bool moveToEnd = true;

  @override
  void initState() {
    super.initState();
    scrollController = ChatScrollController();
    chatTextController = ChatTextEditingController();
    scrollController.addListener(_scrollListener);
    player = AudioPlayer();
    initialize();
    final chatBloc = context.read<ChatBloc>();
    if (widget.chatParams.chatId == null) {
      chatBloc.add(CreateChatMessageEvent());
    } else {
      chatBloc.add(ChatInitialEvent(chatId: widget.chatParams.chatId!));
    }
  }

  void _scrollListener() {}

  initialize() async {
    await player.setAudioSource(
      AudioSource.asset(
        'assets/audios/send_message_sound.mp3',
      ),
    );
  }

  @override
  void dispose() {
    chatTextController.dispose();
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log('Chat Page Build Called', name: _fileName);
    final chatParams = ModalRoute.of(context)!.settings.arguments as ChatParams;
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
          body: NotificationListener<ScrollMetricsNotification>(
            onNotification: (notification) {
              if (notification.metrics.hasContentDimensions && moveToEnd) {
                scrollController.jumpTo(notification.metrics.extentAfter);
                moveToEnd = false;
              }
              return true;
            },
            child: Center(
              child: CpBaseWidget(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Expanded(
                          child: BlocBuilder<ChatBloc, ChatState>(
                              builder: (context, state) {
                            var list = CpChatListView(
                              messages: state.messages.reversed.toList(),
                              isResponseLoading:
                                  state is ChatResponseLoadingState,
                              isActive: widget.chatParams.isActive,
                              scrollController: scrollController,
                            );

                            return list;
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
      moveToEnd = true;
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
