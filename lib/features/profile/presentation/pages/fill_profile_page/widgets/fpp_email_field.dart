import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/profile/presentation/blocs/fill_profile_bloc/fill_profile_bloc.dart';
import 'package:intl/intl.dart';

class FppDateOfBirthField extends StatelessWidget {
  const FppDateOfBirthField({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FillProfileBloc>();
    final dateOfBirthController = context.read<DateOfBirthTextEditingController>();
    return FppBaseWidget(
      child: TextFormField(
        controller: dateOfBirthController,
        decoration: InputDecoration(
          hintText: 'Date Of Birth',
          helperText: '',
          suffixIcon: GestureDetector(
            onTap: () {
              showDatePicker(
                context: context,
                firstDate: DateTime(1960),
                lastDate: DateTime.now(),
              ).then((value) {
                if(value != null){
                  bloc.add(UpdateFillDateOfBirthEvent(dateOfBirth: value));
                  dateOfBirthController.text = DateFormat(DateFormat.YEAR_MONTH_DAY).format(value);
                }
              },);
            },
            child: const Icon(
              Icons.calendar_month,
            ),
          ),
        ),
        validator: InputValidations.emptyValidator,
      ),
    );
  }
}
