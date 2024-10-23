import 'package:ai_chat_bot/features/activity/data/models/activity_model.dart';
import 'package:ai_chat_bot/features/activity/data/source/local/activity_local_source.dart';
import 'package:ai_chat_bot/features/activity/domain/entities/activity.dart';
import 'package:ai_chat_bot/features/activity/domain/repository/activity_repository.dart';

class ActivityRepositoryImpl extends ActivityRepository{

  final ActivityLocalSource source;

  ActivityRepositoryImpl({required this.source});

  @override
  Future<bool> activityExists(Activity activity) {
    return source.hasActivity(ActivityModel.fromActivity(activity));
  }

  @override
  Future<void> deleteActivity(Activity activity) async{
    var isDeleted = await source.deleteActivity(ActivityModel.fromActivity(activity));
  }

  @override
  Future<List<Activity>> getActivites() {
    return source.getActivites();
  }

  @override
  Future<Activity?> getRecordedActivity(DateTime todayDate) {
    return source.getActivity(todayDate);
  }

  @override
  Future<void> initActivity(Activity activity) async{
    var isInserted = await source.insertActivity(ActivityModel.fromActivity(activity));
  }

  @override
  Future<void> updateActivity(Activity activity) async{
    var isUpdated = await source.updateActivity(ActivityModel.fromActivity(activity));
  }
  
}