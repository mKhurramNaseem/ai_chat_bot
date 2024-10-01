
import 'package:ai_chat_bot/core/util/app_errors.dart';
import 'package:ai_chat_bot/features/chat/domain/entities/chat.dart';
import 'package:ai_chat_bot/features/chat/domain/repository/chat_repository.dart';
import 'package:dartz/dartz.dart';

class GetEndedChatsUsecase {
  final ChatMessagesRepository chatMessagesRepository;
  GetEndedChatsUsecase({required this.chatMessagesRepository});

  Future<Either<ChatFailure,List<Chat>>> call(){
    return chatMessagesRepository.getEndedChats();
  }
}