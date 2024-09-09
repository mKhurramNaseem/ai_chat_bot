import 'package:ai_chat_bot/core/core.dart';

class FpSendCodeBody extends StatelessWidget {
  // Flexes
  static const _topSpace = 5, _imageFlex = 25, _imageBelowSpace = 2;
  static const _textFlex = 10, _textBelowSpace = 2, _detailedBoxFlex = 20;
  static const _btnFlex = 33, _belowSpace = 3;
  const FpSendCodeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Spacer(
          flex: _topSpace,
        ),
        Expanded(
          flex: _imageFlex,
          child: FpImage(),
        ),
        Spacer(
          flex: _imageBelowSpace,
        ),
        Expanded(
          flex: _textFlex,
          child: FpSelectionText(),
        ),
        Spacer(
          flex: _textBelowSpace,
        ),
        Expanded(
          flex: _detailedBoxFlex,
          child: FpDetailBox(email: 'askfromjamshaid@gmail.com'),
        ),
        Expanded(
          flex: _btnFlex,
          child: FpContinueButton(),
        ),
        Spacer(
          flex: _belowSpace,
        ),
      ],
    );
  }
}
