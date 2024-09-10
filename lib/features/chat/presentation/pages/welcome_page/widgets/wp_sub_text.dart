import 'package:ai_chat_bot/core/core.dart';

class WpSubText extends StatelessWidget {
  static const _text = 'Lets Have Fun with Bobo!';
  const WpSubText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        _text,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
