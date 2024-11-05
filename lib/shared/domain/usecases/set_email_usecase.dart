import 'package:ai_chat_bot/shared/domain/repository/email_repository.dart';

class SetEmailUsecase {
  final EmailRepository emailRepository;

  SetEmailUsecase(this.emailRepository);

  void call(String email){
    emailRepository.setCurrentEmail(email);
  }
}