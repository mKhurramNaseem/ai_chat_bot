import 'package:ai_chat_bot/core/core.dart';

class EppEmailField extends StatelessWidget {
  const EppEmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return EppBaseWidget(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: TextFormField(
          controller: context.read<EmailTextEditingController>(),
          validator: InputValidations.emailValidatior,
          readOnly: true,
          decoration: const InputDecoration(
            hintText: 'Email',
            helperText: '',
            suffixIcon: Icon(
              Icons.email_outlined,
            ),
          ),
        ),
      ),
    );
  }
}
