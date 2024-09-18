import 'package:ai_chat_bot/core/core.dart';

class LipTitle extends StatelessWidget {
  const LipTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: Text(
            'Let\'s you in',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: constraints.maxHeight * 0.35,
                ),
          ),
        );
      },
    );
  }
}
