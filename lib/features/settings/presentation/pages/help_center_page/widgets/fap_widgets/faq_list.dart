import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/settings/domain/model/faq.dart';
import 'package:ai_chat_bot/features/settings/presentation/pages/help_center_page/widgets/hcp_base_widget.dart';

class FaqList extends SliverList {
  FaqList({super.key, required List<Faq> list})
      : super.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return FaqListTile(
              faq: list[index],
              initiallyExpanded: index == 0,
            );
          },
        );
}

class FaqListTile extends StatelessWidget {
  final Faq faq;
  final bool initiallyExpanded;
  const FaqListTile({
    super.key,
    required this.faq,
    required this.initiallyExpanded,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: HcpBaseWidget(
        child: ExpansionTile(
          title: Text(faq.question),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          initiallyExpanded: initiallyExpanded,
          collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
          collapsedBackgroundColor:
              Theme.of(context).colorScheme.onPrimaryContainer,
          trailing: Icon(
            faq.isLiked ? Icons.favorite_outlined : Icons.favorite_outline,
            color: AppColors.cyan,
          ),
          children: [
            const HcpBaseWidget(
              child: Divider(),
            ),
            HcpBaseWidget(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text(
                  faq.answer,
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
