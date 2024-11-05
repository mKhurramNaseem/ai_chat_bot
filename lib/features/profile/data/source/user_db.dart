import 'package:ai_chat_bot/features/profile/data/models/user_model.dart';
import 'package:ai_chat_bot/features/profile/domain/entities/user.dart';

abstract class UserDb {
  Future<UserProfile> getUser(String email);
  Future<bool> insertUser(UserModel user);
  Future<bool> updateUser(UserModel user);
}
