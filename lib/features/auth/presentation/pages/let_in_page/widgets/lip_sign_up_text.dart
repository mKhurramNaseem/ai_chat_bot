import 'package:ai_chat_bot/core/core.dart';

class LipSignUpText extends StatelessWidget {
  static const _noAccountText = 'Don\'t have an account? ',
      _signUpText = 'Sign up';
  const LipSignUpText({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _noAccountText,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: constraints.maxHeight * 0.35,
                ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(CreateAccountPage.pageName);
            },
            child: Padding(
              padding: const EdgeInsets.all(AppConstants.iconPadding),
              child: Text(
                _signUpText,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.cyan,
                    fontSize: constraints.maxHeight * 0.35),
              ),
            ),
          ),
        ],
      );
    });
  }
}
