import 'dart:async';

import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/domain/entities/chat.dart';
import 'package:ai_chat_bot/features/chat/domain/usecases/delete_chat_usecase.dart';
import 'package:ai_chat_bot/features/chat/domain/usecases/get_ended_chats_usecase.dart';

part 'end_chats_event.dart';
part 'end_chats_state.dart';

class EndChatsBloc extends Bloc<EndChatsEvent, EndChatsState> {
  final GetEndedChatsUsecase getEndedChatsUsecase;
  final DeleteChatUsecase deleteChatUsecase;
  EndChatsBloc({required this.getEndedChatsUsecase, required this.deleteChatUsecase,}) : super(EndChatsInitialState()) {
    on<EndChatsFetchEvent>(_handleEndChatsFetchEvent);
    on<EndChatsDeleteEvent>(_handleEndChatDeleteEvent);
  }

  FutureOr<void> _handleEndChatsFetchEvent(EndChatsFetchEvent event, Emitter<EndChatsState> emit) async{
    var result = await getEndedChatsUsecase();    
    if(result.isRight()){
      var activeChats =  result.getOrElse(() => [],);
      if(activeChats.isEmpty){
        emit(EndChatsEmptyState());
      }else{
        emit(EndChatsDoneState(endedChats: activeChats));
      }      
    }
  }

  FutureOr<void> _handleEndChatDeleteEvent(EndChatsDeleteEvent event, Emitter<EndChatsState> emit) async{
    var result = await deleteChatUsecase(event.chatId);
    if(result.isRight()){
      if(result.getOrElse(() => false,)){
        add(EndChatsFetchEvent());
      }
    }
  }
}
