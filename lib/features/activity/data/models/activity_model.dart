
import 'package:ai_chat_bot/core/util/app_extensions.dart';
import 'package:ai_chat_bot/features/activity/domain/entities/activity.dart';

class ActivityModel extends Activity {
  static const createTable = 'CREATE TABLE $tableName ($dateCol TEXT PRIMARY KEY, $startTimeCol INTEGER, $endTimeCol INTEGER, $durationCol INTEGER)';
  static const tableName = 'ActivitesTable';
  static const dateCol = 'date';
  static const startTimeCol = 'startTime';
  static const endTimeCol = 'endTime';
  static const durationCol = 'duration';  
  ActivityModel(
      {required super.startTime,
      required super.endTime,
      required super.date,
      required super.duration});

  ActivityModel.fromMap(Map<String, dynamic> map)
      : this(
          date: ((map[dateCol] ?? '') as String).toDateTime(),
          startTime:
              DateTime.fromMillisecondsSinceEpoch((map[startTimeCol] ?? 0) as int),
          endTime: DateTime.fromMillisecondsSinceEpoch((map[endTimeCol] ?? 0) as int),
          duration: Duration(milliseconds: (map[durationCol] ?? 0) as int),
        );

  Map<String, dynamic> toMap() {
    return {      
      dateCol: date.toKey(),
      startTimeCol: startTime.millisecondsSinceEpoch,
      endTimeCol: endTime.millisecondsSinceEpoch,
      durationCol: duration.inMilliseconds,
    };
  }

  ActivityModel.fromActivity(Activity activity)
      : this(
          date: activity.date,
          duration: activity.duration,
          startTime: activity.startTime,
          endTime: activity.endTime,
        );

}
