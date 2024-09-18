import 'package:ai_chat_bot/core/core.dart';


class HelpCenterPage extends StatelessWidget {
  static const pageName = '/helpCenterPage';
  const HelpCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: HcpAppBar(),
        body: const Center(
          child: TabBarView(
            children: [
              FaqPart(),
              ContactUsPart(),
            ],
          ),
        ),
      ),
    );
  }
}

