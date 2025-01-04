import 'package:ai_chat_bot/features/chat/domain/entities/chat.dart';

class ChatModel extends Chat {
  static const ended = 0, onWay = 1;
  // Constants
  static const tableName = 'Chats';
  static const startTimeCol = 'startTime';
  static const endTimeCol = 'endTime';
  static const isEndedCol = 'isEnded';
  static const lastMessageCol = 'lastMessage';
  static const chatIdCol = 'chatId';
  static const createTable = 'CREATE TABLE IF NOT EXISTS $tableName ($chatIdCol INTEGER PRIMARY KEY, $startTimeCol INTEGER, $endTimeCol INTEGER, $isEndedCol INTEGER, $lastMessageCol TEXT)';
  ChatModel({
    required super.chatId,
    required super.startTime,
    required super.endTime,
    required super.isEnded,
    required super.lastMessage,
  });
  ChatModel.fromMap(Map<String, dynamic> map)
      : this(
          chatId: map[chatIdCol],
          startTime: DateTime.fromMillisecondsSinceEpoch(map[startTimeCol]),
          endTime: DateTime.fromMillisecondsSinceEpoch(map[endTimeCol]),
          isEnded: map[isEndedCol] == ended,
          lastMessage: map[lastMessageCol],
        );
  Map<String, dynamic> toMap() {
    return {
      chatIdCol: chatId,
      startTimeCol: startTime.millisecondsSinceEpoch,
      endTimeCol: endTime.millisecondsSinceEpoch,
      isEndedCol: isEnded ? ended : onWay,
      lastMessageCol: lastMessage,
    };
  }
}
