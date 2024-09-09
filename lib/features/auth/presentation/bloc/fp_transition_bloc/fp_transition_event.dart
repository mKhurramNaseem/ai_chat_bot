part of 'fp_transition_bloc.dart';

@immutable
class FpTransitionEvent {
  final PageType widgetType;
  const FpTransitionEvent({required this.widgetType});
}
