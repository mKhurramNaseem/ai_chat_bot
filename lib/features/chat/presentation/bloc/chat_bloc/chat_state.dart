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
final class ChatResponseLoadingState extends ChatState {
  const ChatResponseLoadingState({required super.messages});  
}


@immutable
final class ChatUpdateState extends ChatState {
  final bool isSender;
  const ChatUpdateState({required super.messages , required this.isSender}); 
}

@immutable
final class ChatErrorState extends ChatState {
  final String message;
  const ChatErrorState({required super.messages , required this.message}); 
}

@immutable
final class ChatMessageEndState extends ChatState {  
  const ChatMessageEndState({required super.messages}); 
}
