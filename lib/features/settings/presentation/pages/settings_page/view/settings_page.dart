import 'package:ai_chat_bot/core/core.dart';

class SettingsPage extends StatelessWidget {
  static const pageName = '/settingsPage';
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SpAppBar(),
      body: const Center(
        child: Column(
          children: [
            Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 26,
              child: SpProfileImage(),
            ),
            Expanded(
              flex: 8,
              child: SpTitle(),
            ),
            Expanded(
              flex: 5,
              child: SpEmailText(),
            ),
            Expanded(
              flex: 7,
              child: SpEditProfileTile(),
            ),
            Expanded(
              flex: 7,
              child: SpLanguageTile(),
            ),
            Expanded(
              flex: 7,
              child: SpDarkModeTile(),
            ),
            Expanded(
              flex: 7,
              child: SpHelpCenterTile(),
            ),
            Expanded(
              flex: 7,
              child: SpLogoutTile(),
            ),
            Spacer(
              flex: 25,
            ),
          ],
        ),
      ),
    );
  }
}
