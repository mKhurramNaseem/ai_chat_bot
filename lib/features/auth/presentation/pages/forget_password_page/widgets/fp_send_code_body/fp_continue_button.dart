import 'package:ai_chat_bot/core/core.dart';

class FpContinueButton extends StatelessWidget {
  static const _text = 'Continue';
  const FpContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return FpBaseWidget(
      child: LayoutBuilder(builder: (context, constraints) {
        return SizedBox(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () {
                context.read<FpTransitionBloc>().add(
                      const FpTransitionEvent(
                          widgetType: PageType.codeSentPage),
                    );
              },
              style: ButtonStyle(
                fixedSize: WidgetStatePropertyAll(
                  Size(constraints.maxWidth,
                      height * AppConstants.btnSizePercent),
                ),
              ),
              child: const Text(_text),
            ),
          ),
        );
      }),
    );
  }
}
