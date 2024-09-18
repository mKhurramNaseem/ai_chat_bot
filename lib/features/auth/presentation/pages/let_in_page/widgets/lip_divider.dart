import 'package:ai_chat_bot/core/core.dart';

class LipDivider extends StatelessWidget {
  static const _text = 'or';
  const LipDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Center(
        child: Row(
          children: [
            const Expanded(
              child: Divider(
                endIndent: 15,
              ),
            ),
            Text(
              _text,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontSize: constraints.maxHeight * 0.2,
                  ),
            ),
            const Expanded(
              child: Divider(
                indent: 15,
              ),
            ),
          ],
        ),
      );
    });
  }
}
