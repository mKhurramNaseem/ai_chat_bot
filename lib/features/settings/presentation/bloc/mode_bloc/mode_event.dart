part of 'mode_bloc.dart';

@immutable
sealed class ModeEvent {}

@immutable
class UpdateModeEvent extends ModeEvent{
  final bool mode;

  UpdateModeEvent({required this.mode});
}
