import 'dart:async';
import 'dart:developer';

import 'package:ai_chat_bot/features/chat/domain/entities/chat.dart';
import 'package:ai_chat_bot/features/chat/domain/usecases/get_active_chats_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'active_chats_event.dart';
part 'active_chats_state.dart';

class ActiveChatsBloc extends Bloc<ActiveChatsEvent, ActiveChatsState> {
  final GetActiveChatsUsecase activeChatsUsecase;
  ActiveChatsBloc({required this.activeChatsUsecase,}) : super(ActiveChatsInitialState()) {
    on<ActiveChatsFetchEvent>(_handleActiveChatsFetchEvent);
  }

  FutureOr<void> _handleActiveChatsFetchEvent(ActiveChatsFetchEvent event, Emitter<ActiveChatsState> emit) async{
    var result = await activeChatsUsecase();
    log(result.toString());
    if(result.isRight()){
      var activeChats =  result.getOrElse(() => [],);
      if(activeChats.isEmpty){
        emit(ActiveChatsEmptyState());
      }else{
        emit(ActiveChatsDoneState(activeChats: activeChats));
      }      
    }
  }
}
