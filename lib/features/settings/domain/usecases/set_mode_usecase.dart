import 'package:ai_chat_bot/features/settings/data/language_source.dart';

class SetModeUsecase {
  final SettingsSource modeSource;

  SetModeUsecase(this.modeSource);
  void call(bool mode) {
    modeSource.setMode(mode);
  }
}
