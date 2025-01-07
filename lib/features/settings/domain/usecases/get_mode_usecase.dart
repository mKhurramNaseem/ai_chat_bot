import 'package:ai_chat_bot/features/settings/data/language_source.dart';

class GetModeUsecase {
  final SettingsSource modeSource;

  GetModeUsecase(this.modeSource);
  bool? call() {
    return modeSource.getMode();
  }
}
