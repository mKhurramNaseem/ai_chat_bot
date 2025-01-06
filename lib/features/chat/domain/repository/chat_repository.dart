  import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/core/util/app_errors.dart';
import 'package:ai_chat_bot/features/chat/data/models/chat_message_model.dart';
import 'package:ai_chat_bot/features/chat/domain/entities/chat.dart';
import 'package:dartz/dartz.dart';

abstract class ChatMessagesRepository {
  Future<Either<ChatFailure, List<ChatMessage>>> getPreviousMessagesList(
      int chatId);
  Future<Either<ChatFailure, List<ChatMessage>>> getUpdatedMessagesList(
      int chatId, ChatMessageModel message);
  Future<Either<ChatFailure, List<ChatMessage>>>
      getUpdatedMessagesListForSender(int chatId, ChatMessageModel message);
  Future<Either<ChatFailure, int>> createChat();
  Future<Either<ChatFailure, void>> startChat(int chatId);
  Future<Either<ChatFailure, List<Chat>>> getEndedChats();
  Future<Either<ChatFailure, List<Chat>>> getActiveChats();
  Future<Either<ChatFailure, bool>> endCurrentSession(int chatId);
  Future<Either<ChatFailure, bool>> clearChat(int chatId);
  Future<Either<ChatFailure,bool>> deleteChat(int chatId);
}
