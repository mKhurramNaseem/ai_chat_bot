import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/auth/presentation/bloc/forget_password_bloc/forget_password_bloc.dart';

class FpContinueButton extends StatelessWidget {
  static const _text = 'Continue';
  const FpContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final email = ModalRoute.of(context)?.settings.arguments as String?;
    return FpBaseWidget(
      child: LayoutBuilder(builder: (context, constraints) {
        return SizedBox(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () {
                if(email != null){
                  context.read<ForgetPasswordBloc>().add(SendOtpEvent(email: email));
                context.read<FpTransitionBloc>().add(
                      const FpTransitionEvent(
                          widgetType: PageType.codeSentPage),
                    );
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
