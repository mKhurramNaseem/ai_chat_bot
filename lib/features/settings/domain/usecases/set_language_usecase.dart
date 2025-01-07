import 'package:ai_chat_bot/features/settings/data/language_source.dart';

class SetLanguageUsecase {
  final SettingsSource languageSource;

  SetLanguageUsecase(this.languageSource);
  void call(String language) {
    languageSource.setLanguage(language);
  }
}
