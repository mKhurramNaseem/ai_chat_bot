import 'dart:async';
import 'package:ai_chat_bot/features/chat/domain/entities/chat.dart';
import 'package:ai_chat_bot/features/chat/domain/usecases/delete_chat_usecase.dart';
import 'package:ai_chat_bot/features/chat/domain/usecases/get_active_chats_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'active_chats_event.dart';
part 'active_chats_state.dart';

class ActiveChatsBloc extends Bloc<ActiveChatsEvent, ActiveChatsState> {
  final GetActiveChatsUsecase activeChatsUsecase;
  final DeleteChatUsecase deleteChatUsecase;
  ActiveChatsBloc({required this.activeChatsUsecase,required this.deleteChatUsecase,}) : super(ActiveChatsInitialState()) {
    on<ActiveChatsFetchEvent>(_handleActiveChatsFetchEvent);
    on<ActiveChatDeleteEvent>(_handleActiveChatDeleteEvent);
  }

  FutureOr<void> _handleActiveChatsFetchEvent(ActiveChatsFetchEvent event, Emitter<ActiveChatsState> emit) async{
    var result = await activeChatsUsecase();    
    if(result.isRight()){
      var activeChats =  result.getOrElse(() => [],);
      if(activeChats.isEmpty){
        emit(ActiveChatsEmptyState());
      }else{
        emit(ActiveChatsDoneState(activeChats: activeChats));
      }      
    }
  }

  FutureOr<void> _handleActiveChatDeleteEvent(ActiveChatDeleteEvent event, Emitter<ActiveChatsState> emit) async{
    var result = await deleteChatUsecase(event.chatId);
    if(result.isRight()){
      var isDeleted = result.getOrElse(() => false,);
      if(isDeleted){
        var chatsResult = await activeChatsUsecase();
        if(result.isRight()){
      add(ActiveChatsFetchEvent());
    }        
      }
    }
  }
}
