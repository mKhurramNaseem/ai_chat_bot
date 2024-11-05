import 'package:ai_chat_bot/core/util/app_errors.dart';
import 'package:ai_chat_bot/features/auth/domain/entities/user_auth_data.dart';
import 'package:dartz/dartz.dart';

abstract class UserAuthRepository {
  Future<Either<UserFailure,bool>> createAccount(UserAuthData userAuth);
  Future<Either<UserFailure,bool>> loginUser(UserAuthData userAuth);
  Future<Either<UserFailure,bool>> sendOTP(String email);
  Either<UserFailure,bool> verifyOTP(String otp);
  Future<Either<UserFailure,bool>> createNewPassword(UserAuthData userAuth);
}