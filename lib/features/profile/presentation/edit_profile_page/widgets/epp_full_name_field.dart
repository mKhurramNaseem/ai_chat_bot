import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/profile/presentation/edit_profile_page/widgets/epp_base_widget.dart';

class EppFullNameField extends StatelessWidget {
  const EppFullNameField({super.key});

  @override
  Widget build(BuildContext context) {
    return EppBaseWidget(
      child: TextFormField(
        initialValue: 'Andrew Ainsley',
        decoration: const InputDecoration(
          hintText: 'Full name',
          helperText: '',
        ),
      ),
    );
  }
}
