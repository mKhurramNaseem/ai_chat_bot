import 'package:ai_chat_bot/core/core.dart';

class FpSendCodeBody extends StatelessWidget {
  // Flexes
  static const _topSpace = 5, _imageFlex = 25, _imageBelowSpace = 2;
  static const _textFlex = 10, _textBelowSpace = 2, _detailedBoxFlex = 20;
  static const _btnFlex = 33, _belowSpace = 3;
  const FpSendCodeBody({super.key});

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)?.settings.arguments as String?;
    return Column(
      children: [
        const Spacer(
          flex: _topSpace,
        ),
        const Expanded(
          flex: _imageFlex,
          child: FpImage(),
        ),
        const Spacer(
          flex: _imageBelowSpace,
        ),
        const Expanded(
          flex: _textFlex,
          child: FpSelectionText(),
        ),
        const Spacer(
          flex: _textBelowSpace,
        ),
        Expanded(
          flex: _detailedBoxFlex,
          child: FpDetailBox(email: email ?? 'askfromjamshaid@gmail.com'),
        ),
        const Expanded(
          flex: _btnFlex,
          child: FpContinueButton(),
        ),
        const Spacer(
          flex: _belowSpace,
        ),
      ],
    );
  }
}
