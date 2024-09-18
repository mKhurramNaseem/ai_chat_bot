import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/profile/presentation/edit_profile_page/widgets/epp_base_widget.dart';

class EppDateOfBirthField extends StatelessWidget {
  const EppDateOfBirthField({super.key});

  @override
  Widget build(BuildContext context) {
    final dateTime = DateTime.now();
    return EppBaseWidget(
      child: TextFormField(
        initialValue: '${dateTime.day}/${dateTime.month}/${dateTime.year}',
        decoration: InputDecoration(
          hintText: 'Date of birth',
          helperText: '',
          suffixIcon: GestureDetector(
            onTap: () {
              showDatePicker(
                context: context,
                firstDate: DateTime(1960),
                lastDate: DateTime.now(),
              );
            },
            child: const Icon(
              Icons.calendar_month,
            ),
          ),
        ),
      ),
    );
  }
}
