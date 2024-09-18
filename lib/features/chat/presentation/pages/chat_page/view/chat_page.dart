import 'package:just_audio/just_audio.dart';
import 'dart:math' as math;
import 'package:ai_chat_bot/core/core.dart';
import 'package:flutter/scheduler.dart';

class ChatPage extends StatefulWidget {
  static const pageName = '/chatPage';
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late ScrollController scrollController;
  late TextEditingController chatTextController;
  late AudioPlayer player;
  var times = 2;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    chatTextController = TextEditingController();
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
    SchedulerBinding.instance.addPostFrameCallback(
      (timeStamp) {
        if (scrollController.hasClients) {
          scrollController
              .jumpTo(scrollController.position.maxScrollExtent * times);
          times = 1;
        }
      },
    );
    return Scaffold(
      appBar: CpAppBar(),
      body: Center(
        child: CpBaseWidget(
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: CustomScrollView(
                      physics: const BouncingScrollPhysics(),
                      controller: scrollController,
                      slivers: [
                        SliverList.builder(
                          itemCount: messages.length,
                          itemBuilder: (context, index) {
                            return messages[index].isSender
                                ? CpSenderTile(text: messages[index].message)
                                : CpReceiverTile(
                                    text: messages[index].message,
                                    showIcon: index > 0
                                        ? messages[index - 1].isSender
                                        : true,
                                  );
                          },
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
                    ),
                  ),
                ],
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: LayoutBuilder(builder: (context, constraints) {
                    return Container(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              flex: 85,
                              child: TextFormField(
                                controller: chatTextController,
                                style: Theme.of(context).textTheme.bodyLarge,
                                validator: InputValidations.emailValidatior,
                                maxLines: 10,
                                minLines: 1,
                                decoration: InputDecoration(
                                  hintText:
                                      'Type a message to ${AppConstants.botName}',
                                  suffixIcon: GestureDetector(
                                    onTap: () async {
                                      await ImagePicker().pickImage(
                                          source: ImageSource.gallery);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Transform.rotate(
                                        angle: (math.pi / 180) * 135,
                                        child: const Icon(Icons.link),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(
                              flex: 2,
                            ),
                            Flexible(
                              flex: 13,
                              child: LayoutBuilder(
                                  builder: (context, constraints) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      HapticFeedback.selectionClick();
                                      messages.add(ChatMessage(
                                          isSender: true,
                                          message:
                                              chatTextController.text.trim()));
                                    });
                                    player.seek(Duration.zero);
                                    player.play();
                                    chatTextController.clear();
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                    padding: const EdgeInsets.all(13.0),
                                    child: Transform.rotate(
                                      angle: math.pi / 180 * 310,
                                      child: const Icon(
                                        Icons.send_rounded,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<ChatMessage> messages = [
  ChatMessage(
    isSender: false,
    message: 'Hello! I am here',
  ),
  ChatMessage(
    isSender: false,
    message: 'Hello! I am here',
  ),
  ChatMessage(
    isSender: true,
    message: 'Hello! I am here',
  ),
  ChatMessage(
    isSender: true,
    message: 'Hello! I am here',
  ),
  ChatMessage(
    isSender: false,
    message: 'Hello! I am here',
  ),
  ChatMessage(
    isSender: false,
    message: 'Hello! I am here',
  ),
  ChatMessage(
    isSender: true,
    message: 'Hello! I am here',
  ),
  ChatMessage(
    isSender: true,
    message: 'Hello! I am here',
  ),
  ChatMessage(
    isSender: true,
    message: 'Hello! I am here',
  ),
  ChatMessage(
    isSender: false,
    message: 'Hello! I am here',
  ),
  ChatMessage(
    isSender: false,
    message: 'Hello! I am here',
  ),
  ChatMessage(
    isSender: true,
    message: 'Hello! I am here',
  ),
  ChatMessage(
    isSender: false,
    message: 'Hello! I am here',
  ),
  ChatMessage(
    isSender: false,
    message: 'Hello! I am here',
  ),
];
