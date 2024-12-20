part of 'chat_bloc.dart';

class ChatEvent {
  const ChatEvent();
}

@immutable
class ChatInitialEvent extends ChatEvent {
  final int chatId;

  const ChatInitialEvent({required this.chatId});
}

@immutable
class CreateChatMessageEvent extends ChatEvent {}

@immutable
class ChatSendMessageEvent extends ChatEvent {
  final ChatMessage message;
  const ChatSendMessageEvent({required this.message});
}

@immutable
class ChatMessageEndEvent extends ChatEvent {}

@immutable
class ClearChatEvent extends ChatEvent {}
