import 'package:ai_chat_bot/core/core.dart';


class WpStartButton extends StatelessWidget {
  static const _text = 'Start Chat with ${AppConstants.botName}';
  const WpStartButton({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return WpBaseWidget(
      child: LayoutBuilder(builder: (context, constraints) {
          return SizedBox(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(HomePage.pageName);
                },
                style: ButtonStyle(
                  fixedSize: WidgetStatePropertyAll(
                    Size(constraints.maxWidth,
                        height * AppConstants.btnSizePercent),
                  ),
                ),
                child: Text(AppLocalizations.of(context)?.startChatWithBobo(AppConstants.botName) ?? _text),
              ),
            ),
          );
        }),
    );
  }
}