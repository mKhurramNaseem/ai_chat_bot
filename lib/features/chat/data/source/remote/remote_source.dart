
import 'package:ai_chat_bot/features/chat/data/models/chat_message_model.dart';

abstract class ChatMesssagesRemoteDataSource {
  Future<ChatMessageModel> sendMessage(ChatMessageModel message, List<ChatMessageModel> historyMessages);
}