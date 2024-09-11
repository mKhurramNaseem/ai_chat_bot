import 'package:ai_chat_bot/core/core.dart';

class FpResendText extends StatelessWidget {
  static const _text = 'Resend code in ', _seconds = ' s';
  static const _time = 53;
  const FpResendText({super.key});

  @override
  Widget build(BuildContext context) {
    return FpBaseWidget(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
            text: _text,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          TextSpan(
            text: _time.toString(),
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.cyan,
                ),
          ),
          TextSpan(
            text: _seconds,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
        ]),
      ),
    );
  }
}
