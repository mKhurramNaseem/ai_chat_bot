import 'package:ai_chat_bot/core/core.dart';

class EcpBaseWidget extends StatelessWidget {
  static const _space = 5, _flex = 90;
  final Widget child;
  const EcpBaseWidget({
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
        Expanded(flex: _flex, child: child),
        const Spacer(
          flex: _space,
        ),
      ],
    );
  }
}