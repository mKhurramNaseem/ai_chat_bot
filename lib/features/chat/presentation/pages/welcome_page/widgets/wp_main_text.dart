import 'package:ai_chat_bot/core/core.dart';

class WpMainText extends StatelessWidget {
  static const _text = 'Welcome, Khurram!👋', _fontSizePercent = 0.4;
  const WpMainText({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Text(
          _text,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: constraints.maxHeight * _fontSizePercent,
              ),
        );
      },
    );
  }
}
