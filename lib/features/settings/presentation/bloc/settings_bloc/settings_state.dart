part of 'settings_bloc.dart';

@immutable
sealed class SettingsState {}

class SettingsInitialState extends SettingsState {}

class SettingsEmailUpdateState extends SettingsState {}

class SettingsNameUpdateState extends SettingsState {}

