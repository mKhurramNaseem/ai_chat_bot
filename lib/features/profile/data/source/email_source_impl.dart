import 'package:ai_chat_bot/features/profile/data/source/email_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmailSourceImpl extends EmailSource{
  static const emailKey = 'currentEmailKey';
  final SharedPreferences sharedPreferences;

  EmailSourceImpl(this.sharedPreferences);
  @override
  String? getCurrentEmail(){
    var email = sharedPreferences.getString(emailKey);
    return email;
  }

  @override
  void setCurrentEmail(String email) {
    sharedPreferences.setString(emailKey, email);    
  }
}