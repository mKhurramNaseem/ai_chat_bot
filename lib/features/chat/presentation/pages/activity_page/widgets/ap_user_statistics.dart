import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/activity_page/widgets/ap_base_widget.dart';

class ApUserStatistics extends StatelessWidget {
  static const _text = 'Your Statistics';
  const ApUserStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    return ApBaseWidget(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Align(
            alignment: Alignment.centerLeft,
            child: Text(
              _text,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: constraints.maxHeight * 0.3,
                  ),
            ),
          );
        },
      ),
    );
  }
}
