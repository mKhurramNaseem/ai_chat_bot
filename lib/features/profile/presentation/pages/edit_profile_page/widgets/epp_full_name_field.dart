import 'package:ai_chat_bot/core/core.dart';

class EppFullNameField extends StatelessWidget {
  const EppFullNameField({super.key});

  @override
  Widget build(BuildContext context) {
    return EppBaseWidget(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: TextFormField(
          controller: context.read<UserNameTextEditingController>(),
          validator: InputValidations.emptyValidator,
          decoration: const InputDecoration(
            hintText: 'Full name',
            helperText: '',
          ),
        ),
      ),
    );
  }
}
