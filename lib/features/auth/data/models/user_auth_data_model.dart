import 'package:ai_chat_bot/features/auth/domain/entities/user_auth_data.dart';

class UserAuthDataModel extends UserAuthData{
  static const emailCol = 'email' , passwordCol = 'password';
  UserAuthDataModel(super.email, super.password);

  Map<String,dynamic> toMap(){
    return {
      emailCol : email,
      passwordCol : password,
    };
  }


  UserAuthDataModel.fromUserAuth(UserAuthData userAuth):this(userAuth.email,userAuth.password);
}