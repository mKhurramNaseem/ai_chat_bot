
import 'package:ai_chat_bot/core/core.dart';
import 'package:dartz/dartz.dart';

class LoginUsecase {
  final UserAuthRepository userAuthRepository;
  LoginUsecase(
    this.userAuthRepository,  );

  Future<Either<UserFailure,bool>> call(UserAuthData userAuth){
    return userAuthRepository.loginUser(userAuth);
  }
}