import 'package:ai_chat_bot/core/core.dart';

class CnppContinueBtn extends StatelessWidget {
  static const _text = 'Continue';
  const CnppContinueBtn({super.key});

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
                FocusScope.of(context).unfocus();
                Navigator.of(context).pushNamed(SetFingerPrintPage.pageName);
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
