import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/welcome_page/widgets/wp_base_widget.dart';

class WpImage extends StatelessWidget {
  static const _space = 12, _flex = 76;
  const WpImage({super.key});

  @override
  Widget build(BuildContext context) {
    return WpBaseWidget(
      child: Row(
        children: [
          const Spacer(
            flex: _space,
          ),
          Expanded(
            flex: _flex,
            child: Image.asset(
              AppImages.simpleImage,
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
