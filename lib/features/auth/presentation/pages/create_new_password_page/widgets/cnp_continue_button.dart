import 'package:ai_chat_bot/core/comman_widgets/error_dialog_base_widget.dart';
import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/auth/presentation/bloc/create_new_password_bloc/create_new_password_bloc.dart';

class CnpContinueButton extends StatelessWidget {
  static const _text = 'Continue';
  const CnpContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final formKey = context.read<GlobalKey<FormState>>();
    final passwordController = context.read<PasswordTextEditingController>();
    final confirmPasswordController =
        context.read<ConfirmPasswordTextEditingController>();
    final bloc = context.read<CreateNewPasswordBloc>();
    final email = ModalRoute.of(context)?.settings.arguments as String?;
    return CnpBaseWidget(
      child: LayoutBuilder(builder: (context, constraints) {
        return SizedBox(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () {
                if (formKey.currentState?.validate() ?? false) {
                  if (passwordController.text
                          .trim()
                          .compareTo(confirmPasswordController.text.trim()) ==
                      0) {
                    if (email != null) {
                      bloc.add(CreateNewPasswordEvent(
                          email: email,
                          password: passwordController.text.trim()));
                    }
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const ErrorDialogBaseWidget(
                            image: AppImages.sadImage,
                            title: 'Error!',
                            subtitle: 'Passwords don\'t match');
                      },
                    );
                  }
                }                
              },
              style: ButtonStyle(
                fixedSize: WidgetStatePropertyAll(
                  Size(constraints.maxWidth,
                      height * AppConstants.btnSizePercent),
                ),
              ),
              child: const Text(_text),
            ),
          ),
        );
      }),
    );
  }
}
