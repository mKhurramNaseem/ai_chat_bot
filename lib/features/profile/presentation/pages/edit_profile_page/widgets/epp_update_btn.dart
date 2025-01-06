import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/profile/presentation/blocs/edit_profile_bloc/edit_profile_bloc.dart';

class EppUpdateBtn extends StatelessWidget {
  const EppUpdateBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final bloc = context.read<EditProfileBloc>();
    final validationKey = context.read<GlobalKey<FormState>>();
    final userNameController = context.read<UserNameTextEditingController>();
    final nickNameController = context.read<NickNameTextEditingController>();
    final dateOfBirthController =
        context.read<DateOfBirthTextEditingController>();
    final emailController = context.read<EmailTextEditingController>();
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: EppBaseWidget(
          child: ElevatedButton(
            onPressed: () {
              if (validationKey.currentState?.validate() ?? false) {
                bloc.add(UpdateProfileEvent(fullName: userNameController.text.trim(), nickName: nickNameController.text.trim(), email: '', profileImagePath: '',));
              }
            },
            style: ButtonStyle(
              fixedSize: WidgetStatePropertyAll(
                Size(0, height * AppConstants.btnSizePercent),
              ),
            ),
            child: Text(AppLocalizations.of(context)?.update ?? 'Update'),
          ),
        ),
      ),
    );
  }
}
