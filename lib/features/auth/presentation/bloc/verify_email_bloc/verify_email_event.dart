part of 'verify_email_bloc.dart';

@immutable
class VerifyEmailEvent {  
  const VerifyEmailEvent();
}


@immutable
class SendOtpEvent extends VerifyEmailEvent {
  final String email;
  const SendOtpEvent(this.email);
}
