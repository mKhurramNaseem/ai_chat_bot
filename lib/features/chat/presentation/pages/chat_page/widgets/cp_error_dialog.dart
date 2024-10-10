import 'package:ai_chat_bot/core/comman_widgets/error_dialog_base_widget.dart';
import 'package:ai_chat_bot/core/core.dart';

class CpErrorDialog extends StatelessWidget {
  static const _errorMessageTitle = 'Error !';
  final String message;
  const CpErrorDialog({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return ErrorDialogBaseWidget(
      title: _errorMessageTitle,
      image: AppImages.crossEyedImage,
      subtitle: message,
    );
  }
}
