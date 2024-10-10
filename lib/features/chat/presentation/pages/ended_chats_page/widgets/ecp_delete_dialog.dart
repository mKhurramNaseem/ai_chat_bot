import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/presentation/bloc/end_chats_bloc/end_chats_bloc.dart';

class EcpDeleteDialog extends StatelessWidget {
  final int chatId;
  const EcpDeleteDialog({super.key , required this.chatId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          MediaQuery.sizeOf(context).width * 0.1,
          MediaQuery.sizeOf(context).height * 0.2,
          MediaQuery.sizeOf(context).width * 0.1,
          MediaQuery.sizeOf(context).height * 0.2),
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.6,
        width: MediaQuery.sizeOf(context).width * 0.8,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            const Spacer(
              flex: 8,
            ),
            Expanded(
              flex: 84,
              child: Column(
                children: [
                  const Spacer(
                    flex: 10,
                  ),
                  Expanded(
                    flex: 32,
                    child: Image.asset(
                      AppImages.crossEyedImage,
                    ),
                  ),
                  const Spacer(
                    flex: 5,
                  ),
                  Expanded(
                    flex: 8,
                    child: LayoutBuilder(builder: (context, constraints) {
                      return Text(
                        'Delete Chat?',
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontSize: constraints.maxHeight * 0.5,
                                ),
                      );
                    }),
                  ),
                  Expanded(
                    flex: 13,
                    child: LayoutBuilder(builder: (context, constraints) {
                      return Text(
                        'Are you sure you want to delete this ended chat?',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: constraints.maxHeight * 0.25,
                            ),
                      );
                    }),
                  ),
                  Expanded(
                    flex: 11,
                    child: LayoutBuilder(builder: (context, constraints) {
                      return SizedBox(
                        width: constraints.maxWidth,
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<EndChatsBloc>().add(EndChatsDeleteEvent(chatId: chatId));
                            Navigator.of(context).pop();
                          },
                          child: const Text('Yes, Delete'),
                        ),
                      );
                    }),
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                  Expanded(
                    flex: 11,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return SizedBox(
                          width: constraints.maxWidth,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                Theme.of(context).colorScheme.inverseSurface,
                              ),
                              foregroundColor: WidgetStatePropertyAll(
                                Theme.of(context).colorScheme.onInverseSurface,
                              ),
                              elevation: const WidgetStatePropertyAll(0.0),
                            ),
                            child: const Text('Cancel'),
                          ),
                        );
                      },
                    ),
                  ),
                  const Spacer(
                    flex: 6,
                  ),
                ],
              ),
            ),
            const Spacer(
              flex: 8,
            ),
          ],
        ),
      ),
    );
  }
}
