import 'package:ai_chat_bot/core/core.dart';

class LapContinueText extends SliverToBoxAdapter {
  static const _text = 'or continue with';
  LapContinueText({super.key})
      : super(
          child: Builder(
            builder: (context) {
              return LapBaseWidget(
                child: Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        endIndent: 15,
                      ),
                    ),
                    Text(
                      _text,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const Expanded(
                      child: Divider(
                        indent: 15,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
}
