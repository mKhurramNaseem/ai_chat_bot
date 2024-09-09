import 'package:ai_chat_bot/core/core.dart';

class AppErrorPage extends StatelessWidget {
  static const pageName = '/errorPage';
  const AppErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: AppColors.red,
        ),
      ),
    );
  }
}
