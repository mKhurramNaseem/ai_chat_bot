

import 'package:ai_chat_bot/core/core.dart';
import 'package:dartz/dartz.dart';

class CreateAccountUsecase {
  final UserAuthRepository userAuthRepository;
  CreateAccountUsecase(
    this.userAuthRepository,  );

  Future<Either<UserFailure,bool>> call(UserAuthData userAuth){    
    return userAuthRepository.createAccount(userAuth);
  }
}
