part of 'login_account_bloc.dart';

@immutable
sealed class LoginAccountState {}

class LoginAccountInitialState extends LoginAccountState {}

class LoginAccountLoadingState extends LoginAccountState {}

class LoginAccountLoadedState extends LoginAccountState {}

class LoginAccountErrorState extends LoginAccountState {
  final String message;
  LoginAccountErrorState({required this.message});
}

