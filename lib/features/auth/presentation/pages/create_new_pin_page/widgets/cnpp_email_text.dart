import 'package:ai_chat_bot/core/core.dart';

class CnppEmailText extends StatelessWidget {
  static const _text = 'Code has been sent to ';
  const CnppEmailText({    
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)?.settings.arguments as String?;
    return FpBaseWidget(
      child: Text(
        '$_text${email?.obscureEmail ?? ''}',
        textAlign: TextAlign.center,
        maxLines: null,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
