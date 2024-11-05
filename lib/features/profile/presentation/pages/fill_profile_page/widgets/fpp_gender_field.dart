import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/profile/presentation/blocs/fill_profile_bloc/fill_profile_bloc.dart';

class FppGenderField extends StatelessWidget {
  const FppGenderField({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FillProfileBloc>();
    return FppBaseWidget(
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
            bloc.add(UpdateFillGenderEvent(isMale: value));
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
