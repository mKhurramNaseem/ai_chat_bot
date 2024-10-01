import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/core/util/app_errors.dart';
import 'package:ai_chat_bot/features/chat/data/models/chat_message_model.dart';
import 'package:ai_chat_bot/features/chat/domain/repository/chat_repository.dart';
import 'package:dartz/dartz.dart';

class GetUpdatedChatUsecase {
  final ChatMessagesRepository repository;
  GetUpdatedChatUsecase(this.repository);

  Future<Either<ChatFailure, List<ChatMessage>>> call(
      int chatId, ChatMessage message) {
    return repository.getUpdatedMessagesList(
      chatId,
      ChatMessageModel(
        isSender: message.isSender,
        message: message.message,
        image: message.image,
      ),
    );
  }
}
