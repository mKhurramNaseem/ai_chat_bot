

import 'package:ai_chat_bot/core/core.dart';
import 'package:dartz/dartz.dart';

class CreateNewPasswordUsecase {
  final UserAuthRepository userAuthRepository;
CreateNewPasswordUsecase(
    this.userAuthRepository,  );

  Future<Either<UserFailure,bool>> call(UserAuthData userAuth){
    return userAuthRepository.createNewPassword(userAuth);
  }
}
