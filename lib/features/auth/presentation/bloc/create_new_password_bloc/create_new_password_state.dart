part of 'create_new_password_bloc.dart';

@immutable
sealed class CreateNewPasswordState {}

class CreateNewPasswordInitialState extends CreateNewPasswordState {}

class CreateNewPasswordLoadingState extends CreateNewPasswordState {}

class CreateNewPasswordLoadedState extends CreateNewPasswordState {}

class CreateNewPasswordErrorState extends CreateNewPasswordState {}
