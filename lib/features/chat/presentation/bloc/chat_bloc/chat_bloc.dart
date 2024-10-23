import 'dart:async';
import 'dart:developer';
import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/domain/usecases/clear_chat_usecase.dart';
import 'package:ai_chat_bot/features/chat/domain/usecases/end_current_session_usecase.dart';
import 'package:ai_chat_bot/features/chat/domain/usecases/start_chat_usecase.dart';
part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final GetPreviousChatUsecase getPreviousChatUsecase;
  final GetUpdatedChatUsecase getUpdatedChatUsecase;
  final CreateChatUsecase createChatUsecase;
  final StartChatUsecase startChatUsecase;
  final SendMessageUsecase sendMessageUsecase;
  final EndCurrentSessionUsecase endCurrentSessionUsecase;
  final ClearChatUsecase clearChatUsecase;
  List<ChatMessage> chats = [];
  int currentChatId = 0;
  bool isFirst = true;
  ChatBloc({
    required this.getUpdatedChatUsecase,
    required this.createChatUsecase,
    required this.sendMessageUsecase,
    required this.getPreviousChatUsecase,
    required this.endCurrentSessionUsecase,
    required this.clearChatUsecase,
    required this.startChatUsecase,
  }) : super(
          const ChatInitialState(
            messages: [],
          ),
        ) {
    on<ChatInitialEvent>(_handleChatInitialEvent);
    on<ChatSendMessageEvent>(_handleSendMessageEvent);
    on<CreateChatMessageEvent>(_handleCreateMessage);
    on<ChatMessageEndEvent>(_handleChatMessageEndEvent);
    on<ClearChatEvent>(_handleClearChatEvent);
  }

  FutureOr<void> _handleSendMessageEvent(
      ChatSendMessageEvent event, Emitter<ChatState> emit) async {
        if(isFirst){
          await startChatUsecase(currentChatId);
          isFirst = false;
        }
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
    } else {
      emit(ChatErrorState(messages: chats, message: 'Unable to get response'));
    }
  }

  FutureOr<void> _handleCreateMessage(
      CreateChatMessageEvent event, Emitter<ChatState> emit) async {
    var result = await createChatUsecase();
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

  FutureOr<void> _handleChatMessageEndEvent(
      ChatMessageEndEvent event, Emitter<ChatState> emit) async {
    var result = await endCurrentSessionUsecase(currentChatId);
    if (result.isRight()) {
      var isEnded = result.getOrElse(
        () => false,
      );
      if (isEnded) {
        emit(ChatMessageEndState(messages: chats));
      }
    }
  }

  FutureOr<void> _handleClearChatEvent(
      ClearChatEvent event, Emitter<ChatState> emit) async {
    var result = await clearChatUsecase(currentChatId);
    if (result.isRight() &&
        result.getOrElse(
          () => false,
        )) {
      var messagesResult = await getPreviousChatUsecase(currentChatId);
      if (messagesResult.isRight()) {
        emit(ChatInitialState(
            messages: messagesResult.getOrElse(
          () => [],
        )));
      } else {
        emit(ChatErrorState(messages: chats, message: 'Unable to fetch chats'));
      }
    } else {
      emit(ChatErrorState(messages: chats, message: 'Unable to clear chats'));
    }
  }

  @override
  void onChange(Change<ChatState> change) {
    log('Current State : ${change.currentState} , Next State : ${change.nextState}',name: 'chat_bloc.dart');  
    super.onChange(change);
  }
}
