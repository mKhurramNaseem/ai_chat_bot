import 'package:ai_chat_bot/core/comman_widgets/dialog_base_widget.dart';
import 'package:ai_chat_bot/core/core.dart';

class CpEndSessionDialog extends StatelessWidget {
  const CpEndSessionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return DialogBaseWidget(
      image: AppImages.crossEyedImage,
      title: 'End Session',
      subtitle:
          'Are you sure you want to end chat session with ${AppConstants.botName}',
      positiveBtnText: 'Yes, End Session',
      negativeBtnText: 'Cancel',
      onPositiveBtnPressed: () {},
      onNegativeBtnPressed: () {},
    );
  }
}
