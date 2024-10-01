part of 'active_chats_bloc.dart';

@immutable
sealed class ActiveChatsState {}

@immutable
final class ActiveChatsInitialState extends ActiveChatsState {}

@immutable
final class ActiveChatsDoneState extends ActiveChatsState {
  final List<Chat> activeChats;

  ActiveChatsDoneState({required this.activeChats});
}

@immutable
final class ActiveChatsEmptyState extends ActiveChatsState {}

