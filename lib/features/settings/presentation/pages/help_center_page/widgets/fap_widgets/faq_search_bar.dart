import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/settings/presentation/pages/help_center_page/widgets/hcp_base_widget.dart';

class FaqSearchBar extends SliverToBoxAdapter {
  FaqSearchBar({super.key})
      : super(
          child: HcpBaseWidget(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15.0,
              ),
              child: TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search',
                  suffixIcon: Icon(
                    Icons.link,
                    color: AppColors.cyan,
                  ),
                ),
              ),
            ),
          ),
        );
}
