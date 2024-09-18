import 'package:ai_chat_bot/core/core.dart';

class LpTitleSuggestedText extends SliverToBoxAdapter {
  static const _text = 'Suggested';
  LpTitleSuggestedText({super.key})
      : super(
          child: Builder(
            builder: (context) {
              return LapBaseWidget(
                child: Text(
                  _text,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              );
            },
          ),
        );
}

class LpTitleLanguageText extends SliverToBoxAdapter {
  static const _text = 'Language';
  LpTitleLanguageText({super.key})
      : super(
          child: Builder(
            builder: (context) {
              return LapBaseWidget(
                child: Text(
                  _text,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              );
            },
          ),
        );
}

class LpSpaceWidget extends SliverToBoxAdapter {
  static const _heightPercent = 0.02;
  LpSpaceWidget({super.key})
      : super(
          child: Builder(
            builder: (context) {
              return LapBaseWidget(
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * _heightPercent,
                ),
              );
            },
          ),
        );
}

class LpSmallSpaceWidget extends SliverToBoxAdapter {
  static const _heightPercent = 0.01;
  LpSmallSpaceWidget({super.key})
      : super(
          child: Builder(
            builder: (context) {
              return LapBaseWidget(
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * _heightPercent,
                ),
              );
            },
          ),
        );
}
