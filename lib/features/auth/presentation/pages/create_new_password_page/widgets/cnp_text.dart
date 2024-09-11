import 'package:ai_chat_bot/core/core.dart';

class CnpText extends StatelessWidget {
  static const _text = 'Create Your New Password';
  const CnpText({super.key});

  @override
  Widget build(BuildContext context) {
    return CnpBaseWidget(
      child: Text(
        _text,
        textAlign: TextAlign.left,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
