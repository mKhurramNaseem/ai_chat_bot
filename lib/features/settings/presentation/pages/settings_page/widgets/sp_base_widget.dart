import 'package:ai_chat_bot/core/core.dart';

class SpBaseWidget extends StatelessWidget {
  static const _space = 5, _flex = 90;
  final Widget child;
  const SpBaseWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(
          flex: _space,
        ),
        Expanded(
          flex: _flex,
          child: child,
        ),
        const Spacer(
          flex: _space,
        ),
      ],
    );
  }
}
