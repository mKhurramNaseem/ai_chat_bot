 import 'package:ai_chat_bot/core/core.dart';

class SfpText extends StatelessWidget {
  static const _text = 'Add a fingerprint to make your account more secure.';
   const SfpText({super.key});
 
   @override
   Widget build(BuildContext context) {
     return Text(
        _text,
        textAlign: TextAlign.center,
        maxLines: null,
        style: Theme.of(context).textTheme.bodyLarge,
      );
   }
 }