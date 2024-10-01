part of 'active_chats_bloc.dart';

@immutable
sealed class ActiveChatsEvent {}

@immutable
class ActiveChatsFetchEvent extends ActiveChatsEvent{}
