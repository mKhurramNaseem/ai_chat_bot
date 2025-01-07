part of 'language_bloc.dart';

@immutable
sealed class LanguageEvent {}

@immutable
class UpdateLanguageEvent extends LanguageEvent {
  final String language;

  UpdateLanguageEvent(this.language);
}
