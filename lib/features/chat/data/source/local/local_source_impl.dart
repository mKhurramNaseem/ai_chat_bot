import 'dart:developer';

import 'package:ai_chat_bot/features/chat/data/models/chat_message_model.dart';
import 'package:ai_chat_bot/features/chat/data/models/chat_model.dart';
import 'package:ai_chat_bot/features/chat/data/source/local/local_source.dart';
import 'package:sqflite/sqflite.dart';

class ChatMessageLocalDataSourceImpl extends ChatLocalDataSource{
  final Database db;

  ChatMessageLocalDataSourceImpl({required this.db});

  @override
  Future<bool> addMessage(int chatId, ChatMessageModel chatMessage) async{
    var noOfRowsEffected = await db.insert(ChatMessageModel.tableName,chatMessage.toMap(chatId));        
    log('[Rows Affected : $noOfRowsEffected]');
    return noOfRowsEffected > 0;
  }

  @override
  Future<int> createChat() async{
    var chatId = newChatId;
    var noOfRowsEffected = await db.insert(ChatModel.tableName, ChatModel(chatId: chatId, startTime: DateTime.now(), endTime: DateTime.now(), isEnded: false, lastMessage: '').toMap(),);
    return chatId;
  }

  int get newChatId => DateTime.now().millisecondsSinceEpoch;

  @override
  Future<bool> deleteChat(int chatId) async{
    var noOfRowsEffected = await db.delete(ChatModel.tableName,where: '${ChatModel.chatIdCol}=?' ,whereArgs: [chatId.toString(),],);   
    return noOfRowsEffected > 0;
  }

  @override
  Future<bool> deleteMessages(int chatId) async{
    var noOfRowsEffected = await db.delete(ChatMessageModel.tableName,where: '${ChatMessageModel.chatIdCol}=?' ,whereArgs: [chatId.toString(),],);   
    return noOfRowsEffected > 0;
  }

  @override
  Future<List<ChatModel>> getAllChats() async{
    var list = await db.query(ChatModel.tableName);
    return list.map((e) => ChatModel.fromMap(e),).toList();
  }

  @override
  Future<List<ChatMessageModel>> getMessages(int chatId) async{
    var list = await db.query(ChatMessageModel.tableName);
    return list.map((e) => ChatMessageModel.fromMap(e),).toList();
  }

  @override
  Future<bool> updateChatLastMessage(int chatId, String message) async{
    var noOfRowsEffected = await db.update(ChatModel.tableName, {ChatModel.lastMessageCol : message},where: '${ChatModel.chatIdCol}=?' , whereArgs: [chatId.toString(),],);    
    return noOfRowsEffected > 0;
  }
}