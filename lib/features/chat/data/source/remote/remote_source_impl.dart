import 'dart:developer';

import 'package:ai_chat_bot/features/chat/data/models/chat_message_model.dart';
import 'package:ai_chat_bot/features/chat/data/source/remote/remote_source.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatMesssagesRemoteSourceImpl extends ChatMesssagesRemoteDataSource{
  static const String _apiKey = 'AIzaSyCwHiLJAHmInAqQHgMmPnOkyG2IGvAneAw';
  @override
  Future<ChatMessageModel> sendMessage(ChatMessageModel message) async{
    log('isCalled');
    final model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: _apiKey,
  );

  var prompt = message.message;
  final content = [Content.text(prompt)];
  final response = await model.generateContent(content);
  log('[Response : ${response.text}]');
  return ChatMessageModel(isSender: false, message: response.text ?? '', image: null);            
  }
}