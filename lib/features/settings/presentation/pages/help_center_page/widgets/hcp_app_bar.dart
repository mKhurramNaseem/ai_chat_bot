import 'package:ai_chat_bot/core/core.dart';

class HcpAppBar extends AppBar {
  static const _title = 'Help Center', _padding = 12.0;
  static const _faqTab = 'FAQ', _contactTab = 'Contact us';
  HcpAppBar({super.key})
      : super(
          title: Builder(builder: (context) {
            return Text(
              AppLocalizations.of(context)?.helpCenter ?? _title,
              style: Theme.of(context).textTheme.bodyLarge,
            );
          }),
          bottom: TabBar(
            padding: const EdgeInsets.symmetric(
              horizontal: _padding,
            ),
            overlayColor: const WidgetStatePropertyAll(
              AppColors.transparent,
            ),
            indicatorWeight: 2.0,
            indicatorSize: TabBarIndicatorSize.tab,
            dividerHeight: 1.0,
            tabs: [
              Builder(builder: (context) {
                return Tab(
                  text: AppLocalizations.of(context)?.faq ?? _faqTab,
                );
              }),
              Builder(builder: (context) {
                return Tab(
                  text: AppLocalizations.of(context)?.contactUs ?? _contactTab,
                );
              }),
            ],
          ),
        );
}
