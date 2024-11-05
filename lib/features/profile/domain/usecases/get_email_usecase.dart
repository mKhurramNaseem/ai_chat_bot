import 'package:ai_chat_bot/features/profile/domain/repository/email_repository.dart';

class GetEmailUsecase {
  final EmailRepository emailRepository;

  GetEmailUsecase(this.emailRepository);

  String? call(){
    return emailRepository.getCurrentEmail();
  }
}