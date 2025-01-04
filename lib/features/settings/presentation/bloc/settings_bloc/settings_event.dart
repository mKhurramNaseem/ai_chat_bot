part of 'settings_bloc.dart';

@immutable
sealed class SettingsEvent {}

@immutable
class SettingsGetDataEvent extends SettingsEvent{}
