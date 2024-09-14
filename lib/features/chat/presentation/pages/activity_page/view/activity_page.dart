import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/activity_page/widgets/ap_app_bar.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/activity_page/widgets/ap_detail_text.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/activity_page/widgets/ap_detail_tile.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/activity_page/widgets/ap_details_chat_activity.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/activity_page/widgets/ap_graph.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/activity_page/widgets/ap_user_statistics.dart';

class ActivityPage extends StatelessWidget {
  static const pageName = '/activityPage';
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApAppBar(),
      body: Center(
        child: Column(
          children: [
            const Expanded(
              flex: 8,
              child: ApUserStatistics(),
            ),
            const Expanded(
              flex: 3,
              child: ApDetailText(),
            ),
            const Spacer(
              flex: 3,
            ),
            const Expanded(
              flex: 37,
              child: ApGraph(),
            ),
            const Spacer(
              flex: 1,
            ),
            const Expanded(
              flex: 8,
              child: ApDetailsChatActivity(),
            ),
            for (int i = 0; i < 6; i++)
              Builder(builder: (context) {
                if (i % 2 == 0) {
                  return const Expanded(
                    flex: 11,
                    child: ApDetailTile(),
                  );
                } else {
                  return const Spacer(
                    flex: 2,
                  );
                }
              }),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
