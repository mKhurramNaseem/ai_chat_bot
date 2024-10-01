import 'package:ai_chat_bot/core/core.dart';

class CpChatField extends StatelessWidget {
  const CpChatField({super.key});

  @override
  Widget build(BuildContext context) {
    final player = context.read<AudioPlayer>();
    return LayoutBuilder(
      builder: (context, constraints) {
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
                    controller: context.read<ChatTextEditingController>(),
                    style: Theme.of(context).textTheme.bodyLarge,
                    validator: InputValidations.emailValidatior,
                    maxLines: 10,
                    minLines: 1,
                    decoration: InputDecoration(
                      hintText: 'Type a message to ${AppConstants.botName}',
                      suffixIcon: GestureDetector(
                        onTap: () {
                          context
                              .read<ImagePickerBloc>()
                              .add(ImagePickerEvent());
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Transform.rotate(
                            angle: 135.degToRad,
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
                  child: LayoutBuilder(builder: (context, constraints) {
                    return GestureDetector(
                      onTap: () {
                        // Give vibration
                        HapticFeedback.selectionClick();
                        // Add message event to chat bloc
                        context.read<ChatBloc>().add(ChatSendMessageEvent(
                            message: ChatMessage(
                                isSender: true,
                                message: context
                                    .read<ChatTextEditingController>()
                                    .text
                                    .trim(), image: null,),));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        padding: const EdgeInsets.all(13.0),
                        child: Transform.rotate(
                          angle: 310.degToRad,
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
      },
    );
  }
}
