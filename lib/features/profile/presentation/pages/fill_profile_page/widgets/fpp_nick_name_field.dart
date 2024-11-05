import 'package:ai_chat_bot/core/core.dart';

class FppNickNameField extends StatelessWidget {
  const FppNickNameField({super.key});

  @override
  Widget build(BuildContext context) {
    return FppBaseWidget(
      child: TextFormField(        
        decoration: const InputDecoration(
          hintText: 'Nick name',
          helperText: '',
        ),
      ),
    );
  }
}