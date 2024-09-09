import 'dart:developer';

import 'package:ai_chat_bot/core/core.dart';

class LapSignInButton extends SliverToBoxAdapter {
  LapSignInButton({super.key})
      : super(
          child: Builder(builder: (context) {
            final height = MediaQuery.sizeOf(context).height;
            return LapBaseWidget(
              child: ElevatedButton(
                onPressed: () {
                  if (context
                          .read<GlobalKey<FormState>>()
                          .currentState
                          ?.validate() ??
                      false) {
                    var emailText =
                        context.read<EmailTextEditingController>().text;
                    var passwordText =
                        context.read<PasswordTextEditingController>().text;
                    log('Email $emailText');
                    log('Password $passwordText');
                  }
                },
                style: ButtonStyle(
                  fixedSize: WidgetStatePropertyAll(
                    Size(0, height * AppConstants.btnSizePercent),
                  ),
                ),
                child: const Text('Sign in'),
              ),
            );
          }),
        );
}
