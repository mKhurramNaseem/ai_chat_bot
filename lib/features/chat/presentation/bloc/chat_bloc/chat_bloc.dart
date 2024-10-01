import 'dart:async';
import 'package:ai_chat_bot/core/core.dart';
part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final GetPreviousChatUsecase getPreviousChatUsecase;
  final GetUpdatedChatUsecase getUpdatedChatUsecase;
  final StartChatUsecase startChatUsecase;
  final SendMessageUsecase sendMessageUsecase;
  List<ChatMessage> chats = [];
  int currentChatId = 0;
  ChatBloc({
    required this.getUpdatedChatUsecase,
    required this.startChatUsecase,
    required this.sendMessageUsecase,
    required this.getPreviousChatUsecase,
  }) : super(
          const ChatInitialState(
            messages: [],
          ),
        ) {
    on<ChatInitialEvent>(_handleChatInitialEvent);
    on<ChatSendMessageEvent>(_handleSendMessageEvent);
    on<StartChatMessageEvent>(_handleStartMessage);
  }

  FutureOr<void> _handleSendMessageEvent(
      ChatSendMessageEvent event, Emitter<ChatState> emit) async {
    var result = await sendMessageUsecase(currentChatId, event.message);
    chats = result.getOrElse(
      () => [],
    );
    emit(ChatUpdateState(messages: chats, isSender: true));
    emit(ChatResponseLoadingState(messages: chats));
    result = await getUpdatedChatUsecase(currentChatId, event.message);
    if (result.isRight()) {
      chats = result.getOrElse(
        () => [],
      );
      emit(ChatUpdateState(messages: chats, isSender: false));
    }
  }

  FutureOr<void> _handleStartMessage(
      StartChatMessageEvent event, Emitter<ChatState> emit) async {
    var result = await startChatUsecase();
    if (result.isRight()) {
      currentChatId = result.getOrElse(
        () => 0,
      );
    }
  }

  FutureOr<void> _handleChatInitialEvent(
      ChatInitialEvent event, Emitter<ChatState> emit) async {
        currentChatId = event.chatId;
    var result = await getPreviousChatUsecase(event.chatId);
    if (result.isRight()) {
      var list = result.getOrElse(
        () => [],
      );
      emit(ChatInitialState(messages: list));
    }
  }
}
