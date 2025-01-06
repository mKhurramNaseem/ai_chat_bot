import 'package:ai_chat_bot/core/core.dart';

class WpBelowText extends StatelessWidget {
  static const _text = 'Start a conversation with ${AppConstants.botName} Right Now';
  const WpBelowText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Text(
        AppLocalizations.of(context)?.startConversion(AppConstants.botName) ?? _text,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
      ),
    );
  }
}
