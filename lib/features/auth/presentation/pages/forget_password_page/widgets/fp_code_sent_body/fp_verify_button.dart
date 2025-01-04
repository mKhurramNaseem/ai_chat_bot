import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/auth/presentation/bloc/forget_password_bloc/forget_password_bloc.dart';


class FpVerifyButton extends StatelessWidget {
  static const _text = 'Verify';
  const FpVerifyButton({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final email = ModalRoute.of(context)?.settings.arguments as String?;
    final firstController = context.read<FirstController>();
    final secondController = context.read<SecondController>();
    final thirdController = context.read<ThirdController>();
    final fourthController = context.read<FourthController>();
    return FpBaseWidget(
      child: LayoutBuilder(builder: (context, constraints) {
        return SizedBox(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () {
                context.read<ForgetPasswordBloc>().add(VerifyOtpEvent(otp: '${firstController.text.trim()}${secondController.text.trim()}${thirdController.text.trim()}${fourthController.text.trim()}'));
                FocusScope.of(context).unfocus();                
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
