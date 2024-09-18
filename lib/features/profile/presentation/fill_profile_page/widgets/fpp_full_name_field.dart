import 'package:ai_chat_bot/core/core.dart';


class FppFullNameField extends StatelessWidget {
  const FppFullNameField({super.key});

  @override
  Widget build(BuildContext context) {
     return FppBaseWidget(
      child: TextFormField(     
        decoration: const InputDecoration(
          hintText: 'Full name',
          helperText: '',
        ),
      ),
    );
  }
}