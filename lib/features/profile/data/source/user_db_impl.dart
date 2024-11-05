// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ai_chat_bot/features/profile/data/models/user_model.dart';
import 'package:sqflite/sqflite.dart';

import 'package:ai_chat_bot/features/profile/data/source/user_db.dart';
import 'package:ai_chat_bot/features/profile/domain/entities/user.dart';

class UserDbImpl extends UserDb {
  final Database db;
  
  UserDbImpl({
    required this.db,
  });

  @override
  Future<User> getUser(String email) async{
    var listOfUsers = await db.query(UserModel.tableName,where: UserModel.emailCol,whereArgs: [email]);
    if(listOfUsers.isNotEmpty){
      return UserModel.fromMap(listOfUsers.first);
    }
    throw Exception("No User Found");
  }

  @override
  Future<bool> insertUser(UserModel user) async{
    var noOfRowsAffected = await db.insert(UserModel.tableName, user.toMap());
    return noOfRowsAffected > 0;
  }

  @override
  Future<bool> updateUser(UserModel user) async{
    var noOfRowsAffected = await db.update(UserModel.tableName, user.toMap());
    return noOfRowsAffected > 0;
  }
}
