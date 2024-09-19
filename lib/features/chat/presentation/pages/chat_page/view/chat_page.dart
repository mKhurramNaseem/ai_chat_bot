import 'dart:developer';

import 'package:ai_chat_bot/core/core.dart';

class ChatPage extends StatelessWidget {
  static const pageName = '/chatPage';
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final messages =
        ModalRoute.of(context)!.settings.arguments as List<ChatMessage>;
    return MultiBlocProvider(
      providers: [
        BlocProvider<ChatBloc>(
          create: (context) => ChatBloc(chats: messages),
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
                          SchedulerBinding.instance
                              .addPostFrameCallback(_postFrameCallback);
                          return CpChatListView(
                            messages: state.messages,
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

  void _postFrameCallback(Duration timeStamp) {
    if (scrollController.hasClients) {      
      log('Called');
      scrollController
          .jumpTo(scrollController.position.maxScrollExtent * times);
      times = 1;
    }
  }

  void _imagePickerBlocListener(BuildContext context, state) {
    if (state is ImagePickerDoneState) {
      var chatBloc = context.read<ChatBloc>();
      FocusManager.instance.primaryFocus?.unfocus();
      var futureOfEditScreen = Navigator.of(context)
          .pushNamed(ImageEditPage.pageName, arguments: state.image);
      futureOfEditScreen.then(
        (value) {
          chatBloc.add(ChatSendMessageEvent(message: value as ChatMessage));
        },
      );
    }
  }

  void _chatBlocStateListener(BuildContext context, ChatState state) {
    if (state is ChatUpdateState) {
      player.seek(Duration.zero);
      player.play();
      context.read<ChatTextEditingController>().clear();
    }
  }
}
