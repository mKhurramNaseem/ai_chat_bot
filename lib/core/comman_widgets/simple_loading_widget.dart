import 'package:ai_chat_bot/core/core.dart';

class SimpleLoadingWidget extends StatelessWidget {
  const SimpleLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).dialogTheme.barrierColor,
      child: const SpinKitCircle(
        color: AppColors.cyan,
      ),
    );
  }
}
