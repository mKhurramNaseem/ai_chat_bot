import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/welcome_page/widgets/wp_app_bar.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/welcome_page/widgets/wp_below_text.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/welcome_page/widgets/wp_image.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/welcome_page/widgets/wp_main_text.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/welcome_page/widgets/wp_start_button.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/welcome_page/widgets/wp_sub_text.dart';

class WelcomePage extends StatelessWidget {
  static const pageName = '/welcomePage';
  static const _imageFlex = 60,
      _mainTextFlex = 10,
      _subTextFlex = 10,
      _belowTextFlex = 7,
      _btnFlex = 10,
      _space = 3;
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WpAppBar(),
      body: const Center(
        child: Column(
          children: [
            Expanded(
              flex: _imageFlex,
              child: WpImage(),
            ),
            Expanded(
              flex: _mainTextFlex,
              child: WpMainText(),
            ),
            Expanded(
              flex: _subTextFlex,
              child: WpSubText(),
            ),
            Expanded(
              flex: _belowTextFlex,
              child: WpBelowText(),
            ),
            Expanded(
              flex: _btnFlex,
              child: WpStartButton(),
            ),
            Spacer(
              flex: _space,
            ),
          ],
        ),
      ),
    );
  }
}
