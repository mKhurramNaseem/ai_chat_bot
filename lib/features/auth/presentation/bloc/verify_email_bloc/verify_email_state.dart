part of 'verify_email_bloc.dart';

@immutable
sealed class VerifyEmailState {}

final class VerifyEmailInitialState extends VerifyEmailState {}

class VerifyEmailLoadingState extends VerifyEmailState {}

class VerifyEmailDoneState extends VerifyEmailState {
  final String email;
  VerifyEmailDoneState(this.email);
}

class VerifyEmailErrorState extends VerifyEmailState {
  final String errorMessage;
  VerifyEmailErrorState(this.errorMessage);
}

class VerifyEmailNoInternetState extends VerifyEmailState {}
