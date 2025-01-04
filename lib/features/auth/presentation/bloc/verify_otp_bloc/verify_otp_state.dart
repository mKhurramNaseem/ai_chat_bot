part of 'verify_otp_bloc.dart';

@immutable
sealed class VerifyOtpState {}

class VerifyOtpInitialState extends VerifyOtpState {}

class VerifyOtpSuccessfulState extends VerifyOtpState {}

class VerifyOtpFailedState extends VerifyOtpState {}
