import 'package:ai_chat_bot/core/core.dart';

class FppEmailField extends StatelessWidget {
  const FppEmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return FppBaseWidget(
      child: TextFormField(        
        decoration: const InputDecoration(
          hintText: 'Email',
          helperText: '',          
          suffixIcon: Icon(
            Icons.email_outlined,
          ),
        ),
      ),
    );
  }
}