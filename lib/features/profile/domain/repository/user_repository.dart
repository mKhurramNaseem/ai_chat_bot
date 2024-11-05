import 'package:ai_chat_bot/core/util/app_errors.dart';
import 'package:ai_chat_bot/features/profile/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<UserFailure, bool>> insertUser(UserProfile user);
  Future<Either<UserFailure, bool>> updateUser(UserProfile user);
  Future<Either<UserFailure, UserProfile>> getUser(String email);
}
