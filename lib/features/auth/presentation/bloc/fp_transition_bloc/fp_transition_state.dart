part of 'fp_transition_bloc.dart';

@immutable
sealed class FpTransitionState {
  final PageType current;
  const FpTransitionState({required this.current});
}

class FpTransitionInitialState extends FpTransitionState {
  const FpTransitionInitialState({required super.current});
}
