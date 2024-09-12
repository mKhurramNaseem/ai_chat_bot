import 'package:ai_chat_bot/core/core.dart';

class DialogBaseWidget extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String positiveBtnText;
  final String negativeBtnText;
  final void Function() onPositiveBtnPressed;
  final void Function() onNegativeBtnPressed;
  const DialogBaseWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.positiveBtnText,
    required this.negativeBtnText,
    required this.onPositiveBtnPressed,
    required this.onNegativeBtnPressed,
  });

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
                    child: LayoutBuilder(builder: (context, constraints) {
                      return SizedBox(
                        width: constraints.maxWidth,
                        child: ElevatedButton(
                          onPressed: onPositiveBtnPressed,
                          child: Text(positiveBtnText),
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
                            onPressed: onNegativeBtnPressed,
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                Theme.of(context).colorScheme.inverseSurface,
                              ),
                              foregroundColor: WidgetStatePropertyAll(
                                Theme.of(context).colorScheme.onInverseSurface,
                              ),
                              elevation: const WidgetStatePropertyAll(0.0),
                            ),
                            child: Text(negativeBtnText),
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
