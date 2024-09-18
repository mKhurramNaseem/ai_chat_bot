import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/auth/presentation/pages/let_in_page/widgets/lip_base_widget.dart';
import 'package:ai_chat_bot/features/auth/presentation/pages/let_in_page/widgets/lip_divider.dart';
import 'package:ai_chat_bot/features/auth/presentation/pages/let_in_page/widgets/lip_image.dart';
import 'package:ai_chat_bot/features/auth/presentation/pages/let_in_page/widgets/lip_providers_btn.dart';
import 'package:ai_chat_bot/features/auth/presentation/pages/let_in_page/widgets/lip_sign_in_btn.dart';
import 'package:ai_chat_bot/features/auth/presentation/pages/let_in_page/widgets/lip_sign_up_text.dart';
import 'package:ai_chat_bot/features/auth/presentation/pages/let_in_page/widgets/lip_title.dart';

class LetInPage extends StatelessWidget {
  static const pageName = '/letInPage';
  const LetInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: const LipBaseWidget(
        child: Column(
          children: [
            Expanded(
              flex: 25,
              child: LipImage(),
            ),
            Expanded(
              flex: 17,
              child: LipTitle(),
            ),
            Expanded(
              flex: 8,
              child: LipFacebookProviderBtn(),
            ),
            Spacer(
              flex: 2,
            ),
            Expanded(
              flex: 8,
              child: LipGoogleProviderBtn(),
            ),
            Spacer(
              flex: 2,
            ),
            Expanded(
              flex: 8,
              child: LipAppleProviderBtn(),
            ),
            Expanded(
              flex: 12,
              child: LipDivider(),
            ),
            Expanded(
              flex: 10,
              child: LipSignInBtn(),
            ),
            Expanded(
              flex: 6,
              child: LipSignUpText(),
            ),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
