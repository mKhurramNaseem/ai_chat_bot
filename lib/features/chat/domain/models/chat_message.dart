// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ChatMessage {
  bool isSender;
  String message;
  ChatMessage({
    required this.isSender,
    required this.message,
  });

  ChatMessage copyWith({
    bool? isSender,
    String? message,
  }) {
    return ChatMessage(
      isSender: isSender ?? this.isSender,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isSender': isSender,
      'message': message,
    };
  }

  factory ChatMessage.fromMap(Map<String, dynamic> map) {
    return ChatMessage(
      isSender: map['isSender'] as bool,
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatMessage.fromJson(String source) => ChatMessage.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ChatMessage(isSender: $isSender, message: $message)';

  @override
  bool operator ==(covariant ChatMessage other) {
    if (identical(this, other)) return true;
  
    return 
      other.isSender == isSender &&
      other.message == message;
  }

  @override
  int get hashCode => isSender.hashCode ^ message.hashCode;
}
