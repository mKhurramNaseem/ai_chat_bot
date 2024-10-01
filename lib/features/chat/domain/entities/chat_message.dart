import 'dart:typed_data';

class ChatMessage {
  bool isSender;
  String message;
  Uint8List? image;
  ChatMessage({
    required this.isSender,
    required this.message,
    required this.image,
  }); 
}
