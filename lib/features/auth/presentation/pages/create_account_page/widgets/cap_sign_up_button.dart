import 'dart:developer';

import 'package:ai_chat_bot/core/core.dart';

class CapSignUpButton extends SliverToBoxAdapter {
  CapSignUpButton({super.key})
      : super(
          child: Builder(builder: (context) {
            final width = MediaQuery.sizeOf(context).width;
            return CapBaseWidget(
              child: ElevatedButton(
                onPressed: () {
                  log('Clicked');
                },
                style: ButtonStyle(
                  fixedSize: WidgetStatePropertyAll(
                    Size(0, width * AppSizes.btnSizePercent),
                  ),
                ),
                child: const Text('Sign up'),
              ),
            );
          }),
        );
}
