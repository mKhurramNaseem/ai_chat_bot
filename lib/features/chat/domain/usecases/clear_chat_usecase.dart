import 'package:ai_chat_bot/core/util/app_errors.dart';
import 'package:ai_chat_bot/features/chat/domain/repository/chat_repository.dart';
import 'package:dartz/dartz.dart';

class ClearChatUsecase {
  final ChatMessagesRepository chatMessagesRepository;

  ClearChatUsecase({required this.chatMessagesRepository});

  Future<Either<ChatFailure, bool>> call(int chatId) {
    return chatMessagesRepository.clearChat(chatId);
  }
}
