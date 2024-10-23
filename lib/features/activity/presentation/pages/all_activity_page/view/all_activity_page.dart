import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/activity/domain/entities/activity.dart';


class AllActivityPage extends StatelessWidget {
  static const pageName = '/allActivityPage';
  const AllActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments;    
    return Scaffold(
      appBar: AapAppBar(),
      body: Center(
        child: args != null && args is List<Activity> ? ListView.builder(
          itemCount: args.length,
          itemBuilder: (context, index) {
            return SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.11,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 7.0),
                child: AapDetailTile(activity: args[index],),
              ),
            );
          },
        ) : const SizedBox(),
      ),
    );
  }
}
