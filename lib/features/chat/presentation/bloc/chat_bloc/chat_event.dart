part of 'chat_bloc.dart';


class ChatEvent {
  const ChatEvent();
}


@immutable
class ChatSendMessageEvent extends ChatEvent{
  final ChatMessage message;

  const ChatSendMessageEvent({required this.message});

}
