import 'package:ai_chat_bot/core/core.dart';

class LapNoAccountSignUp extends SliverToBoxAdapter {
  static const _alreadyAccountText = 'Don\'t have an account ',
      _signInText = 'Sign up';
  LapNoAccountSignUp({super.key})
      : super(child: Builder(
          builder: (context) {
            return LapBaseWidget(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)?.dontHaveAccount ??
                        _alreadyAccountText,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (Navigator.of(context).canPop()) {
                        Navigator.of(context).pop();
                      } else {
                        Navigator.of(context)
                            .pushNamed(CreateAccountPage.pageName);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(AppConstants.iconPadding),
                      child: Text(
                        AppLocalizations.of(context)?.signUp ?? _signInText,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: AppColors.cyan,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ));
}
