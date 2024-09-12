
import 'package:ai_chat_bot/core/core.dart';
import 'package:flutter/cupertino.dart';



class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings setttings){
    return switch(setttings.name){
      CreateAccountPage.pageName => CupertinoPageRoute(builder: (context) => const CreateAccountPage(),),
      LoginAccountPage.pageName => CupertinoPageRoute(builder: (context) => const LoginAccountPage(),),
      ForgetPasswordPage.pageName => CupertinoPageRoute(builder: (context) => const ForgetPasswordPage(),),
      CreateNewPasswordPage.pageName => CupertinoPageRoute(builder: (context) => const CreateNewPasswordPage(),),
      WelcomePage.pageName => CupertinoPageRoute(builder: (context) => const WelcomePage(),),
      HomePage.pageName => CupertinoPageRoute(builder: (context) => const HomePage(),),
      EndedChatsPage.pageName => CupertinoPageRoute(builder: (context) => const EndedChatsPage(),),
      ChatPage.pageName => CupertinoPageRoute(builder: (context) => const ChatPage(),),
      _ => CupertinoPageRoute(builder: (context) => const AppErrorPage(),),
    };
  }
}