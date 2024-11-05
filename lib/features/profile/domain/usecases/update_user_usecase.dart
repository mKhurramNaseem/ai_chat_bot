import 'package:ai_chat_bot/core/util/app_errors.dart';
import 'package:ai_chat_bot/features/profile/domain/entities/user.dart';
import 'package:ai_chat_bot/features/profile/domain/repository/user_repository.dart';
import 'package:dartz/dartz.dart';

class UpdateUserUsecase {
  final UserRepository userRepository;

  UpdateUserUsecase(this.userRepository);

  Future<Either<UserFailure,bool>> call(User user){
    return userRepository.updateUser(user);
  }

}