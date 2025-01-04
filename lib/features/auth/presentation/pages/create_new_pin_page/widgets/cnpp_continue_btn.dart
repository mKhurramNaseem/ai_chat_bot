import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/auth/presentation/bloc/verify_otp_bloc/verify_otp_bloc.dart';

class CnppContinueBtn extends StatelessWidget {
  static const _text = 'Continue';
  const CnppContinueBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    var firstController = context.read<FirstController>();
    var secondController = context.read<SecondController>();
    var thirdController = context.read<ThirdController>();
    var fourthController = context.read<FourthController>();
    return CnpBaseWidget(
      child: LayoutBuilder(builder: (context, constraints) {
        return SizedBox(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                context.read<VerifyOtpBloc>().add(VerifyOtpEvent(otp: '${firstController.text}${secondController.text}${thirdController.text}${fourthController.text}' ));
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
