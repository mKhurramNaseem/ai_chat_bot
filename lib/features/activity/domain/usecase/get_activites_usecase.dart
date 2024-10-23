import 'package:ai_chat_bot/features/activity/domain/entities/activity.dart';
import 'package:ai_chat_bot/features/activity/domain/repository/activity_repository.dart';

class GetActivitesUsecase {
  final ActivityRepository repository;

  GetActivitesUsecase(this.repository);

  Future<List<Activity>> call(){
    return repository.getActivites();
  }
}