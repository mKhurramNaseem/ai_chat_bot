import 'package:ai_chat_bot/core/core.dart';

class CnpContinueButton extends StatelessWidget {
  static const _text = 'Continue';
  const CnpContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return CnpBaseWidget(
      child: LayoutBuilder(builder: (context, constraints) {
        return SizedBox(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(WelcomePage.pageName);
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
