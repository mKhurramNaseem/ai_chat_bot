part of 'mode_bloc.dart';

@immutable
sealed class ModeState {}

@immutable
class ModeInitialState extends ModeState {}

@immutable
class ModeUpdateState extends ModeState {
  final bool mode;

  ModeUpdateState(this.mode);
}
