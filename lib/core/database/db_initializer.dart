import 'package:ai_chat_bot/features/activity/data/models/activity_model.dart';
import 'package:ai_chat_bot/features/chat/data/models/chat_message_model.dart';
import 'package:ai_chat_bot/features/chat/data/models/chat_model.dart';
import 'package:ai_chat_bot/features/profile/data/models/user_model.dart';
import 'package:sqflite/sqflite.dart';

class DbInitializer {
  static Future<Database> initialize() async{
    var path = await getDatabasesPath();
    var database = await openDatabase('$path/my_db' ,version: 1, onCreate: (db, version) async{
      await db.execute(ChatMessageModel.createTable);
      await db.execute(ChatModel.createTable);
      await db.execute(ActivityModel.createTable);
      await db.execute(UserModel.createTable);
    },);
    return database;
  }
}