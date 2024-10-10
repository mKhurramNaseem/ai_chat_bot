import 'dart:async';
import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/domain/usecases/end_current_session_usecase.dart';
part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final GetPreviousChatUsecase getPreviousChatUsecase;
  final GetUpdatedChatUsecase getUpdatedChatUsecase;
  final StartChatUsecase startChatUsecase;
  final SendMessageUsecase sendMessageUsecase;
  final EndCurrentSessionUsecase endCurrentSessionUsecase;
  List<ChatMessage> chats = [];
  int currentChatId = 0;
  ChatBloc({
    required this.getUpdatedChatUsecase,
    required this.startChatUsecase,
    required this.sendMessageUsecase,
    required this.getPreviousChatUsecase,
    required this.endCurrentSessionUsecase,
  }) : super(
          const ChatInitialState(
            messages: [],
          ),
        ) {
    on<ChatInitialEvent>(_handleChatInitialEvent);
    on<ChatSendMessageEvent>(_handleSendMessageEvent);
    on<StartChatMessageEvent>(_handleStartMessage);
    on<ChatMessageEndEvent>(_handleChatMessageEndEvent);
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
    }else{
      emit(ChatErrorState(messages: chats, message: 'Unable to get response'));
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

  FutureOr<void> _handleChatMessageEndEvent(ChatMessageEndEvent event, Emitter<ChatState> emit) async{
    var result = await endCurrentSessionUsecase(currentChatId);
    if(result.isRight()){
      var isEnded = result.getOrElse(() => false,);
      if(isEnded){
        emit(ChatMessageEndState(messages: chats));
      }
    }
  }
}
