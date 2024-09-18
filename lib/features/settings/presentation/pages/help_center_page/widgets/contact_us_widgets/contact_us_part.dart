import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/settings/presentation/pages/help_center_page/widgets/contact_us_widgets/contact_us_tile.dart';

class ContactUsPart extends StatelessWidget {
  const ContactUsPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(
          flex: 3,
        ),
        Expanded(
          flex: 10,
          child: ContactUsTile(
            title: 'WhatsApp',
            iconData: FontAwesomeIcons.whatsapp,
            onTap: () {},
          ),
        ),
        const Spacer(
          flex: 2,
        ),
        Expanded(
          flex: 10,
          child: ContactUsTile(
            title: 'Website',
            iconData: Icons.language_rounded,
            onTap: () {},
          ),
        ),
        const Spacer(
          flex: 2,
        ),
        Expanded(
          flex: 10,
          child: ContactUsTile(
            title: 'Facebook',
            iconData: FontAwesomeIcons.facebook,
            onTap: () {},
          ),
        ),
        const Spacer(
          flex: 2,
        ),
        Expanded(
          flex: 10,
          child: ContactUsTile(
            title: 'Twitter',
            iconData: FontAwesomeIcons.twitter,
            onTap: () {},
          ),
        ),
        const Spacer(
          flex: 2,
        ),
        Expanded(
          flex: 10,
          child: ContactUsTile(
            title: 'Instagram',
            iconData: FontAwesomeIcons.instagram,
            onTap: () {},
          ),
        ),
        const Spacer(
          flex: 39,
        )
      ],
    );
  }
}
