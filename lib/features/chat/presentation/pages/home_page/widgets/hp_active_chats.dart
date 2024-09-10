import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/home_page/widgets/hp_base_widget.dart';

class HpActiveChats extends StatelessWidget {
  static const _activeText = 'Active Chats';
  static const _fontSizePercent = 0.3;
  const HpActiveChats({super.key});

  @override
  Widget build(BuildContext context) {
    return HpBaseWidget(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Text(
            _activeText,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.black,
                  fontSize: constraints.maxHeight * _fontSizePercent,
                ),
          );
        },
      ),
    );
  }
}