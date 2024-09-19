import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/presentation/bloc/edit_image_bloc/edit_image_bloc.dart';

class IepChatField extends StatelessWidget {
  const IepChatField({super.key});

  @override
  Widget build(BuildContext context) {
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
                    decoration: const InputDecoration(
                      hintText: 'Type a message to ${AppConstants.botName}',
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
                        context.read<EditImageBloc>().add(
                            WidgetToImageConversionEvent(
                                widgetKey: context.read<GlobalKey>()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        padding: const EdgeInsets.all(13.0),
                        child: const Icon(
                          Icons.send_rounded,
                          color: AppColors.white,
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
