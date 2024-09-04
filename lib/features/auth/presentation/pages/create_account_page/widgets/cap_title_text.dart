import '../../../../../../core/core.dart';

class CapTitleText extends SliverToBoxAdapter {
  static const _capTitle = 'Create your\nAccount';
  CapTitleText({super.key})
      : super(
          child: Builder(
            builder: (context) {
              final width = MediaQuery.sizeOf(context).width;
              return CapBaseWidget(
                child: Text(
                  _capTitle,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: width * AppSizes.titleFontSizePercent,
                      ),
                ),
              );
            },
          ),
        );
}
