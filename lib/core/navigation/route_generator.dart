
import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/auth/presentation/pages/create_new_pin_page/view/create_new_pin_page.dart';
import 'package:ai_chat_bot/features/auth/presentation/pages/let_in_page/view/let_in_page.dart';
import 'package:ai_chat_bot/features/auth/presentation/pages/set_finger_print_page/view/set_finger_print_page.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/activity_page/view/activity_page.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/all_activity_page/view/all_activity_page.dart';
import 'package:ai_chat_bot/features/profile/presentation/edit_profile_page/view/edit_profile_page.dart';
import 'package:ai_chat_bot/features/profile/presentation/fill_profile_page/view/fill_profile_page.dart';
import 'package:ai_chat_bot/features/settings/presentation/pages/help_center_page/view/help_center_page.dart';
import 'package:ai_chat_bot/features/settings/presentation/pages/language_page/view/language_page.dart';
import 'package:flutter/cupertino.dart';



class RouteGenerator {
  static List<Route<dynamic>> onGenerateInitialRoutes(String name){    
      return [onGenerateRoute(RouteSettings(name: name))];   
  }
  static Route<dynamic> onGenerateRoute(RouteSettings setttings){
    return switch(setttings.name){
      LetInPage.pageName => CupertinoPageRoute(builder: (context) => const LetInPage(),),
      CreateAccountPage.pageName => CupertinoPageRoute(builder: (context) => const CreateAccountPage(),),
      LoginAccountPage.pageName => CupertinoPageRoute(builder: (context) => const LoginAccountPage(),),
      ForgetPasswordPage.pageName => CupertinoPageRoute(builder: (context) => const ForgetPasswordPage(),),
      CreateNewPasswordPage.pageName => CupertinoPageRoute(builder: (context) => const CreateNewPasswordPage(),),
      WelcomePage.pageName => CupertinoPageRoute(builder: (context) => const WelcomePage(),),
      HomePage.pageName => CupertinoPageRoute(builder: (context) => const HomePage(),),
      EndedChatsPage.pageName => CupertinoPageRoute(builder: (context) => const EndedChatsPage(),),
      ChatPage.pageName => CupertinoPageRoute(builder: (context) => const ChatPage(),),
      ActivityPage.pageName => CupertinoPageRoute(builder: (context) => const ActivityPage(),),
      SettingsPage.pageName => CupertinoPageRoute(builder: (context) => const SettingsPage(),),
      LanguagePage.pageName => CupertinoPageRoute(builder: (context) => const LanguagePage(),),
      HelpCenterPage.pageName => CupertinoPageRoute(builder: (context) => const HelpCenterPage(),),
      EditProfilePage.pageName => CupertinoPageRoute(builder: (context) => const EditProfilePage(),),
      AllActivityPage.pageName => CupertinoPageRoute(builder: (context) => const AllActivityPage(),),
      FillProfilePage.pageName => CupertinoPageRoute(builder: (context) => const FillProfilePage(),),
      CreateNewPinPage.pageName => CupertinoPageRoute(builder: (context) => const CreateNewPinPage(),),
      SetFingerPrintPage.pageName => CupertinoPageRoute(builder: (context) => const SetFingerPrintPage(),),
      _ => CupertinoPageRoute(builder: (context) => const AppErrorPage(),),
    };
  }
}