part of 'forget_password_bloc.dart';

@immutable
sealed class ForgetPasswordEvent {}

@immutable
class SendOtpEvent extends ForgetPasswordEvent {
  final String email;

  SendOtpEvent({required this.email});
}

@immutable
class VerifyOtpEvent extends ForgetPasswordEvent {
  final String otp;

  VerifyOtpEvent({required this.otp});
}
