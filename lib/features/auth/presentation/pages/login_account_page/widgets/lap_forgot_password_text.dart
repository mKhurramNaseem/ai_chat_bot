import 'package:ai_chat_bot/core/core.dart';

class LapForgotPasswordText extends SliverToBoxAdapter {
  static const _text = 'Forgot the password?';
  LapForgotPasswordText({super.key, required GlobalKey<FormFieldState> emailKey})
      : super(
          child: Builder(
            builder: (context) {
              return LapBaseWidget(
                child: GestureDetector(
                  onTap: () {
                    if(emailKey.currentState?.validate() ?? false){
                      Navigator.of(context).pushNamed(ForgetPasswordPage.pageName,arguments: context.read<EmailTextEditingController>().text.trim());
                    }                    
                  },
                  child: Text(
                    AppLocalizations.of(context)?.forgotPassword ?? _text,
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
