import 'package:ai_chat_bot/core/comman_widgets/dialog_base_widget.dart';
import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/injection_container.dart';
import 'package:ai_chat_bot/shared/domain/usecases/set_email_usecase.dart';

class SpLogoutDialog extends StatelessWidget {
  const SpLogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    SetEmailUsecase setEmailUsecase = sl<SetEmailUsecase>();
    return DialogBaseWidget(
      image: AppImages.sadImage,
      title: 'Logout',
      subtitle: 'Are you sure you want to log out?',
      positiveBtnText: 'Yes, Logout',
      negativeBtnText: 'Cancel',
      onPositiveBtnPressed: () {
        setEmailUsecase(null);
        Navigator.of(context).pushNamedAndRemoveUntil(LoginAccountPage.pageName , (route) => false,);
      },
      onNegativeBtnPressed: () {},
    );
  }
}
