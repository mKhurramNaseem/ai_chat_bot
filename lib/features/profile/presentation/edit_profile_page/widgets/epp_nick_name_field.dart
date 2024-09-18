import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/profile/presentation/edit_profile_page/widgets/epp_base_widget.dart';

class EppNickNameField extends StatelessWidget {
  const EppNickNameField({super.key});

  @override
  Widget build(BuildContext context) {
    return EppBaseWidget(
      child: TextFormField(
        initialValue: 'Andrew',
        decoration: const InputDecoration(
          hintText: 'Nick name',
          helperText: '',
        ),
      ),
    );
  }
}
