import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/auth/presentation/pages/create_new_password_page/widgets/cnp_base_widget.dart';

class CnpImage extends StatelessWidget {
  static const _space = 17, _childFlex = 66;
  const CnpImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CnpBaseWidget(
      child: Row(
        children: [
          const Spacer(
            flex: _space,
          ),
          Expanded(
            flex: _childFlex,
            child: Image.asset(
              AppImages.simpleImage,
              fit: BoxFit.contain,
            ),
          ),
          const Spacer(
            flex: _space,
          ),
        ],
      ),
    );
  }
}
