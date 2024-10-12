import 'package:ai_chat_bot/features/chat/data/models/chat_message_model.dart';
import 'package:ai_chat_bot/features/chat/data/models/chat_model.dart';

abstract class ChatLocalDataSource{    
  // Chat Related Functions
  Future<int> createChat();
  Future<bool> updateChatLastMessage(int chatId, String message);
  Future<bool> deleteChat(int chatId);  
  Future<List<ChatModel>> getAllChats();
  // Messages Related Functions
  Future<bool> addMessage(int chatId,ChatMessageModel chatMessage);
  Future<List<ChatMessageModel>> getMessages(int chatId);
  Future<bool> deleteMessages(int chatId);
  Future<bool> endChat(int chatId);  
}