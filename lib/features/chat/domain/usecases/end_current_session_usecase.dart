import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/core/util/app_errors.dart';
import 'package:dartz/dartz.dart';

class EndCurrentSessionUsecase {
  final ChatMessagesRepository repository;

  EndCurrentSessionUsecase(this.repository);

  Future<Either<ChatFailure,bool>> call(int chatId){
    return repository.endCurrentSession(chatId);
  }
}