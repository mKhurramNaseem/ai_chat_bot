import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/auth/presentation/pages/create_new_password_page/widgets/cnp_base_widget.dart';

class CnpText extends StatelessWidget {
  static const _text = 'Create Your New Password';
  const CnpText({super.key});

  @override
  Widget build(BuildContext context) {
    return const CnpBaseWidget(
      child: Text(
        _text,
        textAlign: TextAlign.left,
      ),
    );
  }
}
