import 'package:ai_chat_bot/features/activity/domain/entities/activity.dart';

abstract class ActivityRepository {
  Future<bool> activityExists(Activity activity);
  Future<void> updateActivity(Activity activity);
  Future<void> initActivity(Activity activity);
  Future<void> deleteActivity(Activity activity);
  Future<Activity?> getRecordedActivity(DateTime todayDate);
  Future<List<Activity>> getActivites();
}
