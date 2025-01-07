import 'package:ai_chat_bot/core/core.dart';

class SettingsSource {
  static const key = 'language';
  static const modeKey = 'mode';
  final SharedPreferences sharedPreferences;

  SettingsSource(this.sharedPreferences);

  void setLanguage(String language) {
    sharedPreferences.setString(key, language);
  }

  String? getLocale() {
    return sharedPreferences.getString(key);
  }

  void setMode(bool mode) {
    sharedPreferences.setBool(modeKey , mode);    
  }

  bool? getMode() {
    return sharedPreferences.getBool(modeKey);
  }
}



