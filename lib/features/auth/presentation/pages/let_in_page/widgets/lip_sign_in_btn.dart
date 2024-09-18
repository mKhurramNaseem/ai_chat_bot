import 'package:ai_chat_bot/core/core.dart';

class LipSignInBtn extends StatelessWidget {
  const LipSignInBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Align(
      alignment: Alignment.topCenter,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return UnconstrainedBox(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(LoginAccountPage.pageName);
              },
              style: ButtonStyle(
                fixedSize: WidgetStatePropertyAll(
                  Size(constraints.maxWidth,
                      height * AppConstants.btnSizePercent),
                ),
              ),
              child: const Text('Sign in with password'),
            ),
          );
        },
      ),
    );
  }
}
