import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/auth/presentation/pages/create_new_pin_page/view/create_new_pin_page.dart';
import 'package:ai_chat_bot/features/profile/presentation/blocs/fill_profile_bloc/fill_profile_bloc.dart';


class FppContinueBtn extends StatelessWidget {
  const FppContinueBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FillProfileBloc>();
    final validationKey = context.read<GlobalKey<FormState>>();
    final userNameController = context.read<UserNameTextEditingController>();
    final nickNameController = context.read<NickNameTextEditingController>();
    final dateOfBirthController =
        context.read<DateOfBirthTextEditingController>();
    final emailController = context.read<EmailTextEditingController>();
    final height = MediaQuery.sizeOf(context).height;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: FppBaseWidget(
          child: ElevatedButton(
            onPressed: () {
              if(validationKey.currentState?.validate() ?? false){
                bloc.add(UpdateFillProfileEvent(email: '',fullName: userNameController.text.trim(),nickName: nickNameController.text.trim()));
                Navigator.of(context).pushNamed(CreateNewPinPage.pageName);
              }
            },
            style: ButtonStyle(
              fixedSize: WidgetStatePropertyAll(
                Size(0, height * AppConstants.btnSizePercent),
              ),
            ),
            child: const Text('Continue'),
          ),
        ),
      ),
    );
  }
}