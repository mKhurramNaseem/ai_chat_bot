import 'package:ai_chat_bot/core/util/app_errors.dart';
import 'package:ai_chat_bot/features/chat/domain/repository/chat_repository.dart';
import 'package:dartz/dartz.dart';

class StartChatUsecase {
  final ChatMessagesRepository repository;
  StartChatUsecase( {required this.repository});
  Future<Either<ChatFailure, void>> call(int chatId) {
    return repository.startChat(chatId);
  }
}