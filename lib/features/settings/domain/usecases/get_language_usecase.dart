import 'package:ai_chat_bot/features/settings/data/language_source.dart';

class GetLanguageUsecase {
  final SettingsSource languageSource;

  GetLanguageUsecase(this.languageSource);
  String? call() {
    return languageSource.getLocale();
  }
}
