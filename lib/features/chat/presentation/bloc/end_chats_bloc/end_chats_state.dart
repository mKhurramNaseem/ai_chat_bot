part of 'end_chats_bloc.dart';

@immutable
sealed class EndChatsState {}

@immutable
final class EndChatsInitialState extends EndChatsState {}

@immutable
final class EndChatsDoneState extends EndChatsState {
  final List<Chat> endedChats;

  EndChatsDoneState({required this.endedChats});
}

@immutable
final class EndChatsEmptyState extends EndChatsState {}

