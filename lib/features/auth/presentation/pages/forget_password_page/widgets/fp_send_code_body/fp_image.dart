import 'package:ai_chat_bot/core/core.dart';

class FpImage extends StatelessWidget {
  static const _space = 10, _imageFlex = 80;
  const FpImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(
          flex: _space,
        ),
        Expanded(
          flex: _imageFlex,
          child: Image.asset(
            AppImages.simpleImage,
          ),
        ),
        const Spacer(
          flex: _space,
        ),
      ],
    );
  }
}
