import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/activity/presentation/pages/activity_page/view/activity_page.dart';
import 'package:ai_chat_bot/features/activity/presentation/pages/all_activity_page/view/all_activity_page.dart';
import 'package:ai_chat_bot/features/auth/presentation/pages/create_new_pin_page/view/create_new_pin_page.dart';
import 'package:ai_chat_bot/features/auth/presentation/pages/let_in_page/view/let_in_page.dart';
import 'package:ai_chat_bot/features/chat/domain/entities/chat_params.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/active_chats_page/view/active_chats_page.dart';
import 'package:ai_chat_bot/features/profile/presentation/pages/edit_profile_page/view/edit_profile_page.dart';
import 'package:ai_chat_bot/features/profile/presentation/pages/fill_profile_page/view/fill_profile_page.dart';
import 'package:ai_chat_bot/features/settings/presentation/pages/help_center_page/view/help_center_page.dart';
import 'package:ai_chat_bot/features/settings/presentation/pages/language_page/view/language_page.dart';
import 'package:flutter/cupertino.dart';

class RouteGenerator {
  static List<Route<dynamic>> onGenerateInitialRoutes(String name) {
    return [onGenerateRoute(RouteSettings(name: name))];
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return switch (settings.name) {
      LetInPage.pageName => CupertinoPageRoute(
          builder: (context) => const LetInPage(),
        ),
      CreateAccountPage.pageName => CupertinoPageRoute(
          builder: (context) => const CreateAccountPage(),
        ),
      LoginAccountPage.pageName => CupertinoPageRoute(
          builder: (context) => const LoginAccountPage(),
        ),
      ForgetPasswordPage.pageName => CupertinoPageRoute(
          builder: (context) => const ForgetPasswordPage(),
          settings: settings,
        ),
      CreateNewPasswordPage.pageName => CupertinoPageRoute(
          builder: (context) => const CreateNewPasswordPage(),
          settings: settings,
        ),
      WelcomePage.pageName => CupertinoPageRoute(
          builder: (context) => const WelcomePage(),
        ),
      HomePage.pageName => CupertinoPageRoute(
          builder: (context) => const HomePage(),
        ),
      ActiveChatsPage.pageName => CupertinoPageRoute(
          builder: (context) => const ActiveChatsPage(),
          settings: settings,
        ),
      EndedChatsPage.pageName => CupertinoPageRoute(
          builder: (context) => const EndedChatsPage(),
          settings: settings,
        ),
      ChatPage.pageName => CupertinoPageRoute(
          builder: (context) {
            var chatParams = settings.arguments as ChatParams;
            return ChatPage(
              chatParams: chatParams,
            );
          },
          settings: settings,
        ),
      ImageEditPage.pageName => CupertinoPageRoute(
          builder: (context) => const ImageEditPage(), settings: settings),
      ActivityPage.pageName => CupertinoPageRoute(
          builder: (context) => const ActivityPage(),
        ),
      SettingsPage.pageName => CupertinoPageRoute(
          builder: (context) => const SettingsPage(),
        ),
      LanguagePage.pageName => CupertinoPageRoute(
          builder: (context) => const LanguagePage(),
        ),
      HelpCenterPage.pageName => CupertinoPageRoute(
          builder: (context) => const HelpCenterPage(),
        ),
      EditProfilePage.pageName => CupertinoPageRoute(
          builder: (context) => const EditProfilePage(),
          settings: settings,
        ),
      AllActivityPage.pageName => CupertinoPageRoute(
          builder: (context) => const AllActivityPage(),
          settings: settings,
        ),
      FillProfilePage.pageName => CupertinoPageRoute(
          builder: (context) => const FillProfilePage(),
        ),
      OTPVerificationPage.pageName => CupertinoPageRoute(
          builder: (context) => const OTPVerificationPage(),
          settings: settings),
      SetFingerPrintPage.pageName => CupertinoPageRoute(
          builder: (context) => const SetFingerPrintPage(),
        ),
      _ => CupertinoPageRoute(
          builder: (context) => const AppErrorPage(),
        ),
    };
  }
}
