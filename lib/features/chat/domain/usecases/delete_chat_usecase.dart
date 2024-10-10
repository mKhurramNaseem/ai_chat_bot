import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/core/util/app_errors.dart';
import 'package:dartz/dartz.dart';

class DeleteChatUsecase {
  final ChatMessagesRepository chatMessagesRepository;

  DeleteChatUsecase({required this.chatMessagesRepository});

  Future<Either<ChatFailure,bool>> call(int chatId){
    return chatMessagesRepository.deleteChat(chatId);
  }
}