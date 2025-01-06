import '../../../../../../core/core.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CapTitleText extends SliverToBoxAdapter {
  static const _capTitle = 'Create your\nAccount';
  CapTitleText({super.key})
      : super(
          child: Builder(
            builder: (context) {
              final height = MediaQuery.sizeOf(context).height;
              return CapBaseWidget(
                child: Text(
                  AppLocalizations.of(context)?.createYourAccount ?? _capTitle,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: height * AppConstants.titleFontSizePercent,
                      ),
                ),
              );
            },
          ),
        );
}
