import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/profile/presentation/edit_profile_page/widgets/epp_base_widget.dart';

class EppEmailField extends StatelessWidget {
  const EppEmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return EppBaseWidget(
      child: TextFormField(
        initialValue: 'andrew_ainsley@yourdomain.com',
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
