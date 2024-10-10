import 'package:ai_chat_bot/core/core.dart';

class ErrorDialogBaseWidget extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  const ErrorDialogBaseWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          MediaQuery.sizeOf(context).width * 0.1,
          MediaQuery.sizeOf(context).height * 0.23,
          MediaQuery.sizeOf(context).width * 0.1,
          MediaQuery.sizeOf(context).height * 0.23),
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
                      image,
                    ),
                  ),
                  const Spacer(
                    flex: 5,
                  ),
                  Expanded(
                    flex: 8,
                    child: LayoutBuilder(builder: (context, constraints) {
                      return Text(
                        title,
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
                        subtitle,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: constraints.maxHeight * 0.25,
                            ),
                      );
                    }),
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
                    flex: 5,
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
