part of 'chat_bloc.dart';

@immutable
sealed class ChatState {
  final List<ChatMessage> messages;

  const ChatState({required this.messages});
}

@immutable
final class ChatInitialState extends ChatState {
  const ChatInitialState({required super.messages});
  
}

@immutable
final class ChatUpdateState extends ChatState {
  const ChatUpdateState({required super.messages}); 
}
