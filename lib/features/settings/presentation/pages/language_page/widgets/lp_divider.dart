import 'package:ai_chat_bot/core/core.dart';

class LpDivider extends SliverToBoxAdapter {
  const LpDivider({super.key})
      : super(
          child: const LapBaseWidget(
            child: Divider(),
          ),
        );
}
