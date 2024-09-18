import 'package:ai_chat_bot/core/core.dart';

class FppContinueBtn extends StatelessWidget {
  const FppContinueBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: FppBaseWidget(
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              fixedSize: WidgetStatePropertyAll(
                Size(0, height * AppConstants.btnSizePercent),
              ),
            ),
            child: const Text('Continue'),
          ),
        ),
      ),
    );
  }
}