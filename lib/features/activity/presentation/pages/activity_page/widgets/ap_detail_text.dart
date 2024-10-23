import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/activity/presentation/pages/activity_page/widgets/ap_base_widget.dart';

class ApDetailText extends StatelessWidget {
  static const _text =
      'Graph of the time you spent with ${AppConstants.botName} this week.';
  const ApDetailText({super.key});

  @override
  Widget build(BuildContext context) {
    return ApBaseWidget(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Align(
            alignment: Alignment.topLeft,
            child: Text(
              _text,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontSize: constraints.maxHeight * 0.7,
                  ),
            ),
          );
        },
      ),
    );
  }
}
