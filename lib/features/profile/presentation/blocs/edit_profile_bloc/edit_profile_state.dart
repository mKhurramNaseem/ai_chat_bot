part of 'edit_profile_bloc.dart';

@immutable
sealed class EditProfileState {}

@immutable
class EditProfileInitialState extends EditProfileState {}

@immutable
class EditProfileLoadingState extends EditProfileState {}

@immutable
class EditProfileLoadedState extends EditProfileState {}

@immutable
class EditProfileErrorState extends EditProfileState {
  final String errorMessage;

  EditProfileErrorState(this.errorMessage);
}



