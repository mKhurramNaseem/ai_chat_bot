import 'package:ai_chat_bot/features/activity/domain/entities/activity.dart';
import 'package:ai_chat_bot/features/activity/domain/repository/activity_repository.dart';

class RecordActivityUsecase {
  final ActivityRepository repository;

  RecordActivityUsecase({required this.repository});

  Future<void> call(Activity activity) async {
    var activityExists = await repository.activityExists(activity);
    if (activityExists) {
      var recordedActivity =
          await repository.getRecordedActivity(activity.date);
      if(recordedActivity != null){
        var duration = recordedActivity.duration + activity.duration;
      recordedActivity      
        ..endTime = activity.endTime
        ..duration = duration;
      await repository.updateActivity(recordedActivity);
      }      
    } else {
      await repository.initActivity(activity);
    }
  }
}
