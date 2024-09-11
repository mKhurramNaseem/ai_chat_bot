import 'package:ai_chat_bot/core/core.dart';

class FpCodeSentText extends StatelessWidget {
  static const _text = 'Code has been send to ';
  final String email;
  const FpCodeSentText({
    super.key,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return FpBaseWidget(
      child: Text(
        '$_text${email.obscureEmail}',
        textAlign: TextAlign.center,
        maxLines: null,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
