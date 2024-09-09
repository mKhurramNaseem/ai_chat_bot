import 'package:ai_chat_bot/core/core.dart';

class CnpBaseWidget extends StatelessWidget {
  static const _spacer = 5, _childFlex = 90;
  final Widget child;
  const CnpBaseWidget({
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
