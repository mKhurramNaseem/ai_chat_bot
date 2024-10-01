import 'package:ai_chat_bot/features/chat/data/models/chat_message_model.dart';
import 'package:ai_chat_bot/features/chat/data/models/chat_model.dart';
import 'package:sqflite/sqflite.dart';

class DbInitializer {
  static Future<Database> initialize() async{
    var path = await getDatabasesPath();
    var database = await openDatabase('$path/my_db' ,version: 1, onCreate: (db, version) {
      db.execute(ChatMessageModel.createTable);
      db.execute(ChatModel.createTable);
    },);
    return database;
  }
}