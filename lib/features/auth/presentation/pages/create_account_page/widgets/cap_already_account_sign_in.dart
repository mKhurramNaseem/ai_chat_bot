import 'package:ai_chat_bot/core/core.dart';

class CapAlreadyAccountSignIn extends SliverToBoxAdapter {
  static const _alreadyAccountText = 'Already have an account ',
      _signInText = 'Sign in';
  CapAlreadyAccountSignIn({super.key})
      : super(child: Builder(
          builder: (context) {
            return CapBaseWidget(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _alreadyAccountText,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.grey,
                        ),
                  ),
                  Text(
                    _signInText,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.cyan,
                        ),
                  ),
                ],
              ),
            );
          },
        ));
}
