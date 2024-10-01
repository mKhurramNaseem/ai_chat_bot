import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/core/util/app_errors.dart';
import 'package:ai_chat_bot/features/chat/domain/repository/chat_repository.dart';
import 'package:dartz/dartz.dart';

class GetPreviousChatUsecase {
  final ChatMessagesRepository repository;
  GetPreviousChatUsecase(this.repository);

  Future<Either<ChatFailure, List<ChatMessage>>> call(int chatId) {
    return repository.getPreviousMessagesList(chatId);
  }
}
