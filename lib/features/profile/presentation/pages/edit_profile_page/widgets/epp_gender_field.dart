import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/profile/presentation/blocs/edit_profile_bloc/edit_profile_bloc.dart';

class EppGenderField extends StatelessWidget {
  const EppGenderField({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<EditProfileBloc>();
    return EppBaseWidget(
      child: DropdownButtonFormField<bool>(        
        dropdownColor: Theme.of(context).colorScheme.onPrimaryContainer,
        items: [
          DropdownMenuItem<bool>(
            value: true,
            child: Text(
              'Male',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          DropdownMenuItem<bool>(
            value: false,
            child: Text(
              'Female',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
        value: true,                
        onChanged: (value) {
          if(value != null){
            bloc.add(UpdateGenderEvent(isMale: value));
          }
        },
        decoration: const InputDecoration(
          hintText: 'Gender',
          helperText: '',
        ),
      ),
    );
  }
}
