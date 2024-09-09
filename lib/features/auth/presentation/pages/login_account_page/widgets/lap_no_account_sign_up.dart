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
                    _alreadyAccountText,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.grey,
                        ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(AppConstants.iconPadding),
                      child: Text(
                        _signInText,
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
