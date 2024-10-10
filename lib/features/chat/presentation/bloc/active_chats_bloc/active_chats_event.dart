part of 'active_chats_bloc.dart';

@immutable
sealed class ActiveChatsEvent {}

@immutable
class ActiveChatsFetchEvent extends ActiveChatsEvent{}

@immutable
class ActiveChatDeleteEvent extends ActiveChatsEvent{
  final int chatId;

  ActiveChatDeleteEvent({required this.chatId});
}
