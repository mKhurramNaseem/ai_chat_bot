import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/profile/presentation/edit_profile_page/widgets/epp_base_widget.dart';

class EppGenderField extends StatelessWidget {
  const EppGenderField({super.key});

  @override
  Widget build(BuildContext context) {
    return EppBaseWidget(
      child: DropdownButtonFormField<String>(
        dropdownColor: Theme.of(context).colorScheme.onPrimaryContainer,
        items: [
          DropdownMenuItem<String>(
            value: 'male',
            child: Text(
              'Male',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          DropdownMenuItem<String>(
            value: 'female',
            child: Text(
              'Female',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
        value: 'male',
        onChanged: (value) {},
        decoration: const InputDecoration(
          hintText: 'Gender',
          helperText: '',
        ),
      ),
    );
  }
}
