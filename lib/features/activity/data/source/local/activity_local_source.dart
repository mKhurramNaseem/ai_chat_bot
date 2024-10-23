import 'package:ai_chat_bot/features/activity/data/models/activity_model.dart';

abstract class ActivityLocalSource {
  Future<bool> hasActivity(ActivityModel activityModel);
  Future<bool> insertActivity(ActivityModel activityModel);
  Future<bool> updateActivity(ActivityModel activityModel);
  Future<bool> deleteActivity(ActivityModel activityModel);
  Future<ActivityModel?> getActivity(DateTime date);
  Future<List<ActivityModel>> getActivites();
}