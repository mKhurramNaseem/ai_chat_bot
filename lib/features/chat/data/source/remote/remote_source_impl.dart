import 'dart:developer';

import 'package:ai_chat_bot/features/chat/data/models/chat_message_model.dart';
import 'package:ai_chat_bot/features/chat/data/source/remote/remote_source.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatMesssagesRemoteSourceImpl extends ChatMesssagesRemoteDataSource{
  static const String _apiKey = 'AIzaSyCwHiLJAHmInAqQHgMmPnOkyG2IGvAneAw';
  @override
  Future<ChatMessageModel> sendMessage(ChatMessageModel message , List<ChatMessageModel> historyMessages,) async{
    log('isCalled');
    final model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: _apiKey,
  );

  var prompt = message.message;
  final content = [Content.text(prompt)];
  final session = model.startChat(history: historyMessages.map((e) {
    if(e.isSender){
      return Content.text(e.message);
    }else{
      return Content.model([TextPart(e.message)]);
    }
  },).toList(),);    
  var response = await session.sendMessage(Content.text(message.message));
  return ChatMessageModel(isSender: false, message: response.text ?? '', image: null);            
  }
}