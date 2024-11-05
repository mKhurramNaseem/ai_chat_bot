part of 'fill_profile_bloc.dart';

@immutable
sealed class FillProfileState {}

@immutable
class FillProfileInitialState extends FillProfileState {}

@immutable
class FillProfileLoadingState extends FillProfileState {}

@immutable
class FillProfileLoadedState extends FillProfileState {}

@immutable
class FillProfileErrorState extends FillProfileState {
  final String errorMessage;

  FillProfileErrorState(this.errorMessage);
}


