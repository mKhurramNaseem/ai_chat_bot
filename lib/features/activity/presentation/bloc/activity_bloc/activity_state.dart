part of 'activity_bloc.dart';

@immutable
sealed class ActivityState {}

final class ActivityInitialState extends ActivityState {}

final class ActivityLoadingState extends ActivityState {}

final class ActivityDoneState extends ActivityState {
  final List<Activity> activites;

  ActivityDoneState(this.activites);
}

final class ActivityErrorState extends ActivityState {}

final class ActivityEmptyState extends ActivityState {}
