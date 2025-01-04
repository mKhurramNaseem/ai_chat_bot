part of 'forget_password_bloc.dart';

@immutable
sealed class ForgetPasswordState {}

class ForgetPasswordInitialState extends ForgetPasswordState {}

class ForgetPasswordLoadingState extends ForgetPasswordState {}

class ForgetPasswordLoadedState extends ForgetPasswordState {}

class ForgetPasswordErrorState extends ForgetPasswordState {}
