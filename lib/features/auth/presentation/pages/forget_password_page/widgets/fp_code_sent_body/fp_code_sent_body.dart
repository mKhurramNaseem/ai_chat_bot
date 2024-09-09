import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/auth/presentation/pages/forget_password_page/widgets/fp_code_sent_body/fp_code_input_fields.dart';
import 'package:ai_chat_bot/features/auth/presentation/pages/forget_password_page/widgets/fp_code_sent_body/fp_resend_text.dart';

class FpCodeSentBody extends StatelessWidget {
  static const _topSpace = 22;
  static const _textFlex = 7, _inputFieldsFlex = 20;
  static const _btnFlex = 41, _belowSpace = 3;
  const FpCodeSentBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Spacer(
          flex: _topSpace,
        ),
        Expanded(
          flex: _textFlex,
          child: FpCodeSentText(
            email: 'askfromjamshaid@gmail.com',
          ),
        ),
        Expanded(
          flex: _inputFieldsFlex,
          child: FpCodeInputFields(),
        ),
        Expanded(
          flex: _textFlex,
          child: FpResendText(),
        ),
        Expanded(
          flex: _btnFlex,
          child: FpVerifyButton(),
        ),
        Spacer(
          flex: _belowSpace,
        ),
      ],
    );
  }
}
