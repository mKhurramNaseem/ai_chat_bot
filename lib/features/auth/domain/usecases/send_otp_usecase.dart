

import 'package:ai_chat_bot/core/core.dart';
import 'package:dartz/dartz.dart';

class SendOtpUsecase {
  final UserAuthRepository userAuthRepository;
SendOtpUsecase(
    this.userAuthRepository,  );

  Future<Either<UserFailure,bool>> call(String email){
    return userAuthRepository.sendOTP(email);
  }
}