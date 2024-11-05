import 'package:ai_chat_bot/shared/data/source/email_source.dart';
import 'package:ai_chat_bot/shared/domain/repository/email_repository.dart';

class EmailRepositoryImpl extends EmailRepository{
  final EmailSource emailSource;

  EmailRepositoryImpl(this.emailSource);
  @override
  String? getCurrentEmail() {
    return emailSource.getCurrentEmail();
  }

  @override
  void setCurrentEmail(String email) {
    emailSource.setCurrentEmail(email);
  }
}