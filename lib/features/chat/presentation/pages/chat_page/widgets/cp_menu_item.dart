import 'package:ai_chat_bot/core/core.dart';

class CpMenuItem extends PopupMenuItem {
  CpMenuItem({
    super.key,
    required Icon icon,
    required String text,
    super.onTap,
  }) : super(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                flex: 30,
                child: icon,
              ),
              const Spacer(
                flex: 10,
              ),
              Flexible(
                flex: 60,
                child: Text(text),
              ),
            ],
          ),
        );
}
