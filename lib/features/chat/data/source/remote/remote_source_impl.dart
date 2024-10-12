import 'package:ai_chat_bot/features/chat/data/models/chat_message_model.dart';
import 'package:ai_chat_bot/features/chat/data/source/remote/remote_source.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatMesssagesRemoteSourceImpl extends ChatMesssagesRemoteDataSource {
  static const String _apiKey = 'AIzaSyCwHiLJAHmInAqQHgMmPnOkyG2IGvAneAw';
  static final _model = GenerativeModel(
    model: 'gemini-1.5-flash',
    apiKey: _apiKey,
  );

  static final _visionModel =
      GenerativeModel(model: 'gemini-pro-vision', apiKey: _apiKey);
  @override
  Future<ChatMessageModel> sendMessage(
    ChatMessageModel message,
    List<ChatMessageModel> historyMessages,
  ) async {
    String response = '';
    if (message.image == null) {
      response = await _messageWithoutImage(message, historyMessages);
    } else {
      response = await _messageWithImage(message, historyMessages);
    }

    return ChatMessageModel(isSender: false, message: response, image: null);
  }

  Future<String> _messageWithoutImage(
      ChatMessageModel message, List<ChatMessageModel> historyMessages) async {
    var prompt = message.message;
    final content = [
      Content.text(prompt),
    ];
    final session = _model.startChat(
      history: historyMessages.map(
        (e) {
          if (e.isSender) {
            return Content.text(e.message);
          } else {
            return Content.model([TextPart(e.message)]);
          }
        },
      ).toList(),
    );
    var response = await session.sendMessage(Content.text(message.message));
    return response.text ?? '';
  }

  Future<String> _messageWithImage(
      ChatMessageModel message, List<ChatMessageModel> historyMessages) async {
    var prompt = TextPart(message.message);
    var imagePart = [DataPart('image/jpeg', message.image!)];
    final content = [
      Content.multi([prompt, ...imagePart]),
    ];
    final session = _visionModel.startChat(
      history: historyMessages.map(
        (e) {
          if (e.isSender) {
            if (e.image != null) {
              return Content.multi([
                TextPart(e.message),
                ...[DataPart('image/jpeg', e.image!)]
              ]);
            }
            return Content.text(e.message);
          } else {
            return Content.model([TextPart(e.message)]);
          }
        },
      ).toList(),
    );
    var response = await session.sendMessage(Content.text(message.message));
    return response.text ?? '';
  }
}
