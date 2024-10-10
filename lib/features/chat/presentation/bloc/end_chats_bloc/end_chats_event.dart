part of 'end_chats_bloc.dart';

@immutable
sealed class EndChatsEvent {}

@immutable
class EndChatsFetchEvent extends EndChatsEvent{}

@immutable
class EndChatsDeleteEvent extends EndChatsEvent{
  final int chatId;

  EndChatsDeleteEvent({required this.chatId});
}

