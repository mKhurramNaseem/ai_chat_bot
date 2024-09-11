import 'package:ai_chat_bot/core/core.dart';

class FpSelectionText extends StatelessWidget {
  static const _text =
      'Select which contact details should we use to reset your password';
  const FpSelectionText({super.key});

  @override
  Widget build(BuildContext context) {
    return FpBaseWidget(
      child: Text(
        _text,
        textAlign: TextAlign.justify,
        maxLines: null,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
