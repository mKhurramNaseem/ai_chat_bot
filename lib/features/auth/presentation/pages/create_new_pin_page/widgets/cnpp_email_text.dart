import 'package:ai_chat_bot/core/core.dart';

class CnppEmailText extends StatelessWidget {
  static const _text = 'Add a PIN number to make your account more secure';
  const CnppEmailText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FpBaseWidget(
      child: Text(
        _text,
        textAlign: TextAlign.center,
        maxLines: null,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
