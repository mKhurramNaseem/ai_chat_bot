import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/auth/presentation/bloc/verify_email_bloc/verify_email_bloc.dart';

class CapVerifyEmailButton extends SliverToBoxAdapter {
  static const _bottomPadding = 10.0, _rightPadding = 8.0;
  CapVerifyEmailButton({
    super.key,
    required GlobalKey<FormFieldState> emailValidationKey,
  }) : super(
          child: CapBaseWidget(
            child: Builder(builder: (context) {
              final height = MediaQuery.sizeOf(context).height;
              final emailController =
                  context.read<EmailTextEditingController>();
              final passwordController =
                  context.read<PasswordTextEditingController>();
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (emailValidationKey.currentState?.validate() ??
                          false) {
                        FocusManager.instance.primaryFocus?.unfocus();
                        context.read<VerifyEmailBloc>().add(
                              SendOtpEvent(
                                emailController.text.trim(),
                              ),
                            );
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: _bottomPadding,
                        right: _rightPadding,
                      ),
                      child: Text(
                        'Verify',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: AppColors.cyan,
                            ),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        );
}
