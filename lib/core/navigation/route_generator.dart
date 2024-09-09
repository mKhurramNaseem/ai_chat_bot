
import 'package:ai_chat_bot/core/core.dart';
import 'package:flutter/cupertino.dart';


class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings setttings){
    return switch(setttings.name){
      CreateAccountPage.pageName => CupertinoPageRoute(builder: (context) => const CreateAccountPage(),),
      LoginAccountPage.pageName => CupertinoPageRoute(builder: (context) => const LoginAccountPage(),),
      ForgetPasswordPage.pageName => CupertinoPageRoute(builder: (context) => const ForgetPasswordPage(),),
      _ => CupertinoPageRoute(builder: (context) => const AppErrorPage(),),
    };
  }
}