import 'dart:io';

class ChatMessage {
  bool isSender;
  String message;
  File? image;
  ChatMessage({
    required this.isSender,
    required this.message,
    required this.image,
  }); 
}
