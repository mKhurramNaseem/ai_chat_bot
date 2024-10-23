import 'dart:developer';

import 'package:ai_chat_bot/features/chat/data/models/chat_message_model.dart';
import 'package:ai_chat_bot/features/chat/data/source/remote/remote_source.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

const _fileName = 'remote_source_impl.dart';

class ChatMesssagesRemoteSourceImpl extends ChatMesssagesRemoteDataSource {
  static const String _apiKey = 'AIzaSyCwHiLJAHmInAqQHgMmPnOkyG2IGvAneAw';
  static final _model = GenerativeModel(
    model: 'gemini-1.5-pro',
    apiKey: _apiKey,
  );
  ChatSession? chatSession;

  @override
  Future<void> startChat(List<ChatMessageModel> historyMessages) {
    log('Start Chat Called History Messages Lenght : ${historyMessages.length}',name: _fileName,error: startChat.toString());
    chatSession = _model.startChat(
      history: historyMessages.map(
        (e) {          
          if (e.isSender) {
            if (e.image != null) {
              return Content.multi(
                [
                  TextPart(e.message),
                  ...[
                    DataPart('${e.image!.hashCode}/jpeg',
                        e.image!.readAsBytesSync()),
                  ],
                ],
              );
            }
            return Content.text(e.message);
          } else {
            return Content.model([TextPart(e.message)]);
          }
        },
      ).toList(),
    );
    return Future.value(null);
  }

  @override
  Future<ChatMessageModel> sendMessage(
    ChatMessageModel message,
  ) async {
    String response = '';
    if (message.image == null) {
      response = await _messageWithoutImage(message);
    } else {
      response = await _messageWithImage(message);
    }

    return ChatMessageModel(isSender: false, message: response, image: null);
  }

  Future<String> _messageWithoutImage(
      ChatMessageModel message) async {
    if (chatSession != null) {
      var prompt = message.message;
      final content = [
        Content.text(prompt),
      ];
      var response =
          await chatSession!.sendMessage(Content.text(message.message));
      return response.text ?? '';
    }
    return '';
  }

  Future<String> _messageWithImage(
      ChatMessageModel message) async {    
        log('Called with Image : ${message.image}' ,name: _fileName);
    if (chatSession != null) {
      var prompt = TextPart(message.message);
      var imageBytes = await message.image!.readAsBytes();
      var imagePart = [
        DataPart(
            '${message.image!.hashCode}/jpeg', imageBytes ),
      ];      
      var response =
          await chatSession!.sendMessage(Content.multi([prompt, ...imagePart]),);
          log('Response : ${response.text}' ,name: _fileName);
      return response.text ?? '';
    }
    return '';
  }
}
