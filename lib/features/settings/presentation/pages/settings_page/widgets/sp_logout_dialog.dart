import 'package:ai_chat_bot/core/comman_widgets/dialog_base_widget.dart';
import 'package:ai_chat_bot/core/core.dart';

class SpLogoutDialog extends StatelessWidget {
  const SpLogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return DialogBaseWidget(
      image: AppImages.sadImage,
      title: 'Logout',
      subtitle: 'Are you sure you want to log out?',
      positiveBtnText: 'Yes, Logout',
      negativeBtnText: 'Cancel',
      onPositiveBtnPressed: () {},
      onNegativeBtnPressed: () {},
    );
  }
}
