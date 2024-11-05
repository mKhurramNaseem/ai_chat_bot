import 'package:ai_chat_bot/core/util/app_errors.dart';
import 'package:ai_chat_bot/features/auth/data/models/user_auth_data_model.dart';
import 'package:ai_chat_bot/features/auth/data/source/user_auth_source.dart';
import 'package:ai_chat_bot/features/auth/domain/entities/user_auth_data.dart';
import 'package:ai_chat_bot/features/auth/domain/repository/user_auth_repository.dart';
import 'package:dartz/dartz.dart';

class UserAuthRepositoryImpl extends UserAuthRepository {
  final UserAuthSource authSource;

  UserAuthRepositoryImpl(this.authSource);
  @override
  Future<Either<UserFailure, bool>> createAccount(UserAuthData userAuth) async {
    try {
      await authSource.createAccount(UserAuthDataModel.fromUserAuth(userAuth));
      return const Right(true);
    } catch (e) {
      return Left(UserFailure());
    }
  }

  @override
  Future<Either<UserFailure, bool>> createNewPassword(
      UserAuthData userAuth) async {
    try {
      await authSource
          .createNewPassword(UserAuthDataModel.fromUserAuth(userAuth));
      return const Right(true);
    } catch (e) {
      return Left(UserFailure());
    }
  }

  @override
  Future<Either<UserFailure, bool>> loginUser(UserAuthData userAuth) async{
    try{
      var isLoggedIn = await authSource.isUserExists(UserAuthDataModel.fromUserAuth(userAuth));
      return Right(isLoggedIn);
    }catch(e){
      return Left(UserFailure());
    }
  }

  @override
  Future<Either<UserFailure, bool>> sendOTP(String email) async{
    try{
      var isSend = await authSource.sendOTP(email);
      return Right(isSend);      
    }catch(e){
      return Left(UserFailure());
    }
  }

  @override
  Either<UserFailure, bool> verifyOTP(String otp) {
    try{
      var isVerified = authSource.verifyOTP(otp);
      return Right(isVerified);
    }catch(e){
      return Left(UserFailure());
    }
  }
}
