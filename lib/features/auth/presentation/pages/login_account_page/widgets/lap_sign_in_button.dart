import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/auth/presentation/bloc/login_account_bloc/login_account_bloc.dart';

class LapSignInButton extends SliverToBoxAdapter {
  LapSignInButton({super.key , required GlobalKey<FormFieldState> emailKey ,required GlobalKey<FormFieldState> passwordKey})  
      : super(
          child: Builder(builder: (context) {
            final height = MediaQuery.sizeOf(context).height;
            var emailController = context.read<EmailTextEditingController>();
            var passwordController = context.read<PasswordTextEditingController>();
            return LapBaseWidget(
              child: ElevatedButton(
                onPressed: () {
                  if ((emailKey.currentState?.validate() ?? false)  && (passwordKey.currentState?.validate() ?? false)) {
                        context.read<LoginAccountBloc>().add(LoginAccountEvent(email: emailController.text.trim(), password: passwordController.text.trim()));
                      }
                  
                },
                style: ButtonStyle(
                  fixedSize: WidgetStatePropertyAll(
                    Size(0, height * AppConstants.btnSizePercent),
                  ),
                ),
                child: Text(AppLocalizations.of(context)?.signIn ??  'Sign in'),
              ),
            );
          }),
        );
}
