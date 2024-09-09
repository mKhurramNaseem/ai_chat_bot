import 'package:ai_chat_bot/core/core.dart';

class LapForgotPasswordText extends SliverToBoxAdapter {
  static const _text = 'Forgot the password?';
  LapForgotPasswordText({super.key})
      : super(
          child: Builder(
            builder: (context) {
              return LapBaseWidget(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(ForgetPasswordPage.pageName);
                  },
                  child: Text(
                    _text,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.cyan,
                        ),
                  ),
                ),
              );
            },
          ),
        );
}
