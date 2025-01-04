import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/auth/presentation/pages/set_finger_print_page/widgets/sfa_base_widget.dart';
import 'package:ai_chat_bot/features/profile/presentation/blocs/fill_profile_bloc/fill_profile_bloc.dart';

class FppBtnRow extends StatelessWidget {
  static const _skipText = 'Skip';
  const FppBtnRow({super.key});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return SfaBaseWidget(
      child: LayoutBuilder(builder: (context, constraints) {
        return SizedBox(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      WelcomePage.pageName,
                      (route) => false,
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Theme.of(context).colorScheme.inverseSurface,
                    ),
                    foregroundColor: WidgetStatePropertyAll(
                      Theme.of(context).colorScheme.onInverseSurface,
                    ),
                    elevation: const WidgetStatePropertyAll(0.0),
                    fixedSize: WidgetStatePropertyAll(
                      Size(constraints.maxWidth / 2.2,
                          height * AppConstants.btnSizePercent),
                    ),
                  ),
                  child: const Text(_skipText),
                ),
                FppContinueBtn(constraints: constraints),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class FppContinueBtn extends StatelessWidget {
  static const _continueText = 'Continue';
  final BoxConstraints constraints;
  const FppContinueBtn({super.key, required this.constraints});

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
    return ElevatedButton(
      onPressed: () {
        if (validationKey.currentState?.validate() ?? false) {
          bloc.add(UpdateFillProfileEvent(              
              fullName: userNameController.text.trim(),
              nickName: nickNameController.text.trim()));                    
        }
      },
      style: ButtonStyle(
        fixedSize: WidgetStatePropertyAll(
          Size(
              constraints.maxWidth / 2.2, height * AppConstants.btnSizePercent),
        ),
      ),
      child: const Text(_continueText),
    );
  }
}
