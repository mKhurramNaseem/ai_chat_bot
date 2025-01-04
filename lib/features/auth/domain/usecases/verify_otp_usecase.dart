

import 'package:ai_chat_bot/core/core.dart';
import 'package:dartz/dartz.dart';

class VerifyOtpUsecase {
  final UserAuthRepository userAuthRepository;
VerifyOtpUsecase(
    this.userAuthRepository,  );

  Either<UserFailure,bool> call(String otp){
    return userAuthRepository.verifyOTP(otp);
  }
}