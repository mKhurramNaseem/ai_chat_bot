import 'package:ai_chat_bot/core/util/app_errors.dart';
import 'package:ai_chat_bot/features/profile/data/models/user_model.dart';
import 'package:ai_chat_bot/features/profile/data/source/user_db.dart';
import 'package:ai_chat_bot/features/profile/domain/entities/user.dart';
import 'package:ai_chat_bot/features/profile/domain/repository/user_repository.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImpl extends UserRepository {
  final UserDb userDb;

  UserRepositoryImpl(this.userDb);
  @override
  Future<Either<UserFailure, UserProfile>> getUser(String email) async {
    try {
      var user = await userDb.getUser(email);
      return Right(user);
    } catch (e) {
      return Left(UserFailure());
    }
  }

  @override
  Future<Either<UserFailure, bool>> insertUser(UserProfile user) async {
    try {
      var isInserted = await userDb.insertUser(UserModel.fromUser(user));
      return Right(isInserted);
    } catch (e) {
      return Left(UserFailure());
    }
  }

  @override
  Future<Either<UserFailure, bool>> updateUser(UserProfile user) async {
    try {
      var isUpdated = await userDb.updateUser(UserModel.fromUser(user));
      return Right(isUpdated);
    } catch (e) {
      return Left(UserFailure());
    }
  }
}
