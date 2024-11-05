import 'package:ai_chat_bot/core/util/app_errors.dart';
import 'package:ai_chat_bot/features/profile/domain/entities/user.dart';
import 'package:ai_chat_bot/features/profile/domain/repository/user_repository.dart';
import 'package:dartz/dartz.dart';

class GetUserUsecase {
  final UserRepository userRepository;

  GetUserUsecase(this.userRepository);

  Future<Either<UserFailure, UserProfile>> call(String email) {
    return userRepository.getUser(email);
  }
}
