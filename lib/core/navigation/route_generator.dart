
import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/auth/presentation/pages/create_new_password_page/view/create_new_password_page.dart';
import 'package:flutter/cupertino.dart';


class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings setttings){
    return switch(setttings.name){
      CreateAccountPage.pageName => CupertinoPageRoute(builder: (context) => const CreateAccountPage(),),
      LoginAccountPage.pageName => CupertinoPageRoute(builder: (context) => const LoginAccountPage(),),
      ForgetPasswordPage.pageName => CupertinoPageRoute(builder: (context) => const ForgetPasswordPage(),),
      CreateNewPasswordPage.pageName => CupertinoPageRoute(builder: (context) => const CreateNewPasswordPage(),),
      _ => CupertinoPageRoute(builder: (context) => const AppErrorPage(),),
    };
  }
}