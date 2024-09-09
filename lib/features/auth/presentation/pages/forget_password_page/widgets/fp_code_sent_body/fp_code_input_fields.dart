import 'package:ai_chat_bot/core/controllers/otp_controllers.dart';
import 'package:ai_chat_bot/core/core.dart';
import 'package:flutter/services.dart';

class FpCodeInputFields extends StatelessWidget {
  const FpCodeInputFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(
          flex: 5,
        ),
        Expanded(
          flex: 15,
          child: TextField(
            controller: context.read<FirstController>(),
            focusNode: context.read<FirstControllerFocus>(),
            keyboardType: TextInputType.number,
            cursorColor: AppColors.transparent,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],                        
          ),
        ),
        const Spacer(
          flex: 5,
        ),
        Expanded(
          flex: 15,
          child: TextField(
            controller: context.read<SecondController>(),
            focusNode: context.read<SecondControllerFocus>(),
            keyboardType: TextInputType.number,
            cursorColor: AppColors.transparent,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],  
          ),
        ),
        const Spacer(
          flex: 5,
        ),
        Expanded(
          flex: 15,
          child: TextField(
            controller: context.read<ThirdController>(),
            focusNode: context.read<ThirdControllerFocus>(),
            keyboardType: TextInputType.number,
            cursorColor: AppColors.transparent,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],  
          ),
        ),
        const Spacer(
          flex: 5,
        ),
        Expanded(
          flex: 15,
          child: TextField(
            controller: context.read<FourthController>(),
            focusNode: context.read<FourthControllerFocus>(),
            keyboardType: TextInputType.number,
            cursorColor: AppColors.transparent,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],  
          ),
        ),
        const Spacer(
          flex: 5,
        ),
      ],
    );
  }
}
