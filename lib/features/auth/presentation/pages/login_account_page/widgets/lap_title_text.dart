import '../../../../../../core/core.dart';

class LapTitleText extends SliverToBoxAdapter {
  static const _capTitle = 'Login to your\nAccount';
  LapTitleText({super.key})
      : super(
          child: Builder(
            builder: (context) {
              final height = MediaQuery.sizeOf(context).height;
              return LapBaseWidget(
                child: Text(
                  AppLocalizations.of(context)?.loginToYourAccount ?? _capTitle,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: height * AppConstants.titleFontSizePercent,
                      ),
                ),
              );
            },
          ),
        );
}
