import 'package:ai_chat_bot/core/core.dart';

class ChatMessageModel extends ChatMessage {
  static const sender = 0 , receiver = 1;
  // Constants
  static const tableName = 'ChatMessages';
  static const isSenderCol = 'isSender';
  static const messaageCol = 'message';
  static const imageCol = 'image';
  static const chatIdCol = 'chatId';
  static const createTable = 'CREATE TABLE $tableName (id INTEGER PRIMARY KEY AUTOINCREMENT, $chatIdCol INTEGER, $messaageCol TEXT, $isSenderCol INTEGER, $imageCol BLOB)';
  ChatMessageModel({
    required super.isSender,
    required super.message,
    required super.image,
  });
  // Redirection to make Child Object from parent object
  ChatMessageModel.fromChatMessage(ChatMessage chatMessage)
      : this(
          isSender: chatMessage.isSender,
          message: chatMessage.message,
          image: chatMessage.image,
        );
        ChatMessageModel.fromMap(Map<String, dynamic> map)
      : this(
          isSender: map[isSenderCol] == sender,
          message: map[messaageCol],
          image: map[imageCol],
        );
  Map<String, dynamic> toMap(int chatId,) {
    return {
      chatIdCol : chatId,
      isSenderCol : isSender ? sender : receiver,
      messaageCol : message,
      imageCol : image,       
    };
  }
  
}
