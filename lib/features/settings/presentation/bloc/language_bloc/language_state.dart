part of 'language_bloc.dart';

@immutable
sealed class LanguageState {}

@immutable
class LanguageInitialState extends LanguageState {}

@immutable
class LanguageUpdatedState extends LanguageState {
  final String locale;

  LanguageUpdatedState(this.locale);
}
