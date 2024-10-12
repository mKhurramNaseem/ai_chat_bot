import 'dart:developer';

import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/image_edit_page/widgets/iep_base_widget.dart';

class IepChatField extends StatelessWidget {
  const IepChatField({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: IepBaseWidget(
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
                            hintText:
                                'Type a message to ${AppConstants.botName}',
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
                            onTap: () async {            
                              log('[Clicked]');                  
                              context.read<WidgetToImageConversionBloc>().add(
                                  WidgetToImageConversionEvent(
                                      widgetKey: context.read<GlobalKey>() , shouldNavigate: true,),);
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
              ),
            );
          },
        ),
      ),
    );
  }
}
