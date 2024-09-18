import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/settings/presentation/pages/help_center_page/widgets/hcp_base_widget.dart';

class ContactUsTile extends StatelessWidget {
  final String title;
  final IconData iconData;
  final void Function() onTap;
  const ContactUsTile({
    super.key,
    required this.title,
    required this.iconData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return HcpBaseWidget(
      child: ListTile(
        title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(title)),
        leading: Icon(
          iconData,
          color: Theme.of(context).colorScheme.primary,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        tileColor: Theme.of(context).colorScheme.onPrimaryContainer,
        onTap: onTap,
      ),
    );
  }
}
