import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/profile/presentation/pages/edit_profile_page/view/edit_profile_page.dart';
import 'package:ai_chat_bot/features/settings/presentation/bloc/settings_bloc/settings_bloc.dart';
import 'package:ai_chat_bot/features/settings/presentation/pages/help_center_page/view/help_center_page.dart';
import 'package:ai_chat_bot/features/settings/presentation/pages/language_page/view/language_page.dart';
import 'package:ai_chat_bot/features/settings/presentation/pages/settings_page/widgets/sp_logout_dialog.dart';

class SpEditProfileTile extends StatelessWidget {
  const SpEditProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: AppIcons.editProfileIcon,
      title: Text(
        AppLocalizations.of(context)?.editProfile ?? 'Edit Profile',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      trailing: AppIcons.forwardIcon,
      onTap: () {
        final userProfile = context.read<SettingsBloc>().userProfile;
        Navigator.of(context).pushNamed(EditProfilePage.pageName , arguments: userProfile).then((value) {
          context.read<SettingsBloc>().add(SettingsGetDataEvent());
        },);
      },
    );
  }
}

class SpLanguageTile extends StatelessWidget {
  const SpLanguageTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: AppIcons.languageIcon,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppLocalizations.of(context)?.language ?? 'Language',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            'English (US)',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
      trailing: AppIcons.forwardIcon,
      onTap: () {
        Navigator.of(context).pushNamed(LanguagePage.pageName);
      },
    );
  }
}

class SpDarkModeTile extends StatelessWidget {
  const SpDarkModeTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var brightness = Theme.of(context).brightness;
    return ListTile(
      leading: AppIcons.darkModeIcon,
      title: Text(
        'Dark Mode',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      trailing: Switch(
        value: brightness == Brightness.dark,
        onChanged: (value) {},
      ),
    );
  }
}

class SpHelpCenterTile extends StatelessWidget {
  const SpHelpCenterTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: AppIcons.helpCenterIcon,
      title: Text(
        AppLocalizations.of(context)?.helpCenter ?? 'Help Center',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      trailing: AppIcons.forwardIcon,
      onTap: () {
        Navigator.of(context).pushNamed(HelpCenterPage.pageName);
      },
    );
  }
}

class SpLogoutTile extends StatelessWidget {
  const SpLogoutTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: AppIcons.logoutIcon,
      title: Text(
        AppLocalizations.of(context)?.logout ?? 'Logout',
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.red,
            ),
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => const SpLogoutDialog(),
        );
      },
    );
  }
}
