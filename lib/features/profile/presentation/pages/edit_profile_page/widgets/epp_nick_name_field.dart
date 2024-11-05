import 'package:ai_chat_bot/core/core.dart';

class EppNickNameField extends StatelessWidget {
  const EppNickNameField({super.key});

  @override
  Widget build(BuildContext context) {
    return EppBaseWidget(
      child: Padding(        
        padding: const EdgeInsets.only(bottom: 5),
        child: TextFormField(
          controller: context.read<NickNameTextEditingController>(),        
          validator: InputValidations.emptyValidator,
          decoration: const InputDecoration(
            hintText: 'Nick name',
            helperText: '',
          ),
        ),
      ),
    );
  }
}
