import 'package:ai_chat_bot/core/core.dart';

class LapBaseWidget extends StatelessWidget {
  static const _childFlex = 90, _spacer = 5;
  final Widget child;
  const LapBaseWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(
          flex: _spacer,
        ),
        Expanded(
          flex: _childFlex,
          child: child,
        ),
        const Spacer(
          flex: _spacer,
        ),
      ],
    );
  }
}
