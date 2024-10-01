
class Chat {
  int chatId;
  DateTime startTime;
  DateTime endTime;
  bool isEnded;
  String lastMessage;
  Chat({
    required this.chatId,
    required this.startTime,
    required this.endTime,
    required this.isEnded,
    required this.lastMessage,
  });  
}
