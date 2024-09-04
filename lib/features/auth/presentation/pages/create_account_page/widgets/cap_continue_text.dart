import 'package:ai_chat_bot/core/core.dart';

class CapContinueText extends SliverToBoxAdapter {
  static const _text = 'or continue with';
  CapContinueText({super.key})
      : super(
          child: Builder(
            builder: (context) {
              return CapBaseWidget(
                child: Text(
                  _text,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.grey,
                      ),
                ),
              );
            },
          ),
        );
}