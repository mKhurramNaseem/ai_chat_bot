
import 'package:ai_chat_bot/features/auth/data/models/user_auth_data_model.dart';

abstract class UserAuthSource {
  Future<bool> isUserExists(UserAuthDataModel userAuth);
  Future<void> createAccount(UserAuthDataModel userAuth);  
  Future<bool> sendOTP(String email);
  bool verifyOTP(String otp);
  Future<void> createNewPassword(UserAuthDataModel userAuth);
}