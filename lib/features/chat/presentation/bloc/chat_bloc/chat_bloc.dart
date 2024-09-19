import 'dart:async';

import 'package:ai_chat_bot/core/core.dart';
part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  List<ChatMessage> chats;
  ChatBloc({required this.chats})
      : super(
          ChatInitialState(messages: chats)
        ) {          
    on<ChatSendMessageEvent>(_handleSendMessageEvent);
  }

  FutureOr<void> _handleSendMessageEvent(
      ChatSendMessageEvent event, Emitter<ChatState> emit) {
    chats.add(event.message);
    emit(ChatUpdateState(messages: chats));
  }
}


