import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/all_activity_page/widgets/aap_app_bar.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/all_activity_page/widgets/aap_tile.dart';

class AllActivityPage extends StatelessWidget {
  static const pageName = '/allActivityPage';
  const AllActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AapAppBar(),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.11,
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 7.0),
                child: AapDetailTile(),
              ),
            );
          },
        ),
      ),
    );
  }
}
