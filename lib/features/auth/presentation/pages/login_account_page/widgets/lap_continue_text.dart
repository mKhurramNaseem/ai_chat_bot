import 'package:ai_chat_bot/core/core.dart';

class LapContinueText extends SliverToBoxAdapter {
  static const _text = 'or continue with';
  LapContinueText({super.key})
      : super(
          child: Builder(
            builder: (context) {
              return LapBaseWidget(
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
