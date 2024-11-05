import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/profile/presentation/blocs/edit_profile_bloc/edit_profile_bloc.dart';
import 'package:intl/intl.dart';


class EppDateOfBirthField extends StatelessWidget {
  const EppDateOfBirthField({super.key});

  @override
  Widget build(BuildContext context) {    
    final dateTime = DateTime.now();
    var dateOfBirthController = context.read<DateOfBirthTextEditingController>();
    final bloc = context.read<EditProfileBloc>();
    return EppBaseWidget(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: TextFormField(
          controller: dateOfBirthController,
          readOnly: true,
          validator: InputValidations.emptyValidator,
          decoration: InputDecoration(
            hintText: 'Date of birth',
            helperText: '',
            suffixIcon: GestureDetector(
              onTap: () {
                showDatePicker(
                  context: context,
                  firstDate: DateTime(1960),
                  lastDate: DateTime.now(),
                ).then((value) {
                  if(value != null){
                    dateOfBirthController.text = DateFormat(DateFormat.YEAR_MONTH_DAY).format(value);
                    bloc.add(UpdateDateOfBirthEvent(dateOfBirth: value));
                  }
                },);
              },
              child: const Icon(
                Icons.calendar_month,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
