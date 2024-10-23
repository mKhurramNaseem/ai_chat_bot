import 'dart:developer';

import 'package:ai_chat_bot/core/util/app_extensions.dart';
import 'package:ai_chat_bot/features/activity/data/models/activity_model.dart';
import 'package:ai_chat_bot/features/activity/data/source/local/activity_local_source.dart';
import 'package:sqflite/sqflite.dart';

const _fileName = 'activity_local_source_impl.dart';

class ActivityLocalSourceImpl extends ActivityLocalSource {
  final Database db;

  ActivityLocalSourceImpl(this.db);
  @override
  Future<bool> deleteActivity(ActivityModel activityModel) async {
    var noOfRowsAffected = await db.delete(
      ActivityModel.tableName,
      where: '${ActivityModel.dateCol}=?',
      whereArgs: [
        activityModel.date.toKey(),
      ],
    );
    return noOfRowsAffected > 0;
  }

  @override
  Future<List<ActivityModel>> getActivites() async {
    var result = await db.query(
        ActivityModel.tableName);
    return result.map(
      (e) {
        log('Mapping Function' , name: _fileName);        
        var activityModel = ActivityModel.fromMap(e);
        log('Milliseconds : ${e[ActivityModel.endTimeCol]}',name: _fileName);
        log('Duration : ${e[ActivityModel.durationCol]}',name: _fileName);
        log('Hour : ${activityModel.endTime.hour}', name: _fileName);
        log('Minute : ${activityModel.endTime.minute}', name: _fileName);
        log('Second : ${activityModel.endTime.second}', name: _fileName);
        return activityModel;
      },
    ).toList();
  }

  @override
  Future<ActivityModel?> getActivity(DateTime date) async {
    var result = await db.query(
      ActivityModel.tableName,
      where: '${ActivityModel.dateCol}=?',
      whereArgs: [date.toKey()],
    );
    if (result.isNotEmpty) {
      return ActivityModel.fromMap(result[0]);
    }
    return null;
  }

  @override
  Future<bool> hasActivity(ActivityModel activityModel) async {
    var result = await db.query(ActivityModel.tableName,
        where: '${ActivityModel.dateCol}=?',
        whereArgs: [activityModel.date.toKey()]);
    log('Exists : ${result.isNotEmpty}', name: _fileName);
    return result.isNotEmpty;
  }

  @override
  Future<bool> insertActivity(ActivityModel activityModel) async {
    var noOfRowsAffected =
        await db.insert(ActivityModel.tableName, activityModel.toMap());
    log('no of rows affected : $noOfRowsAffected', name: _fileName);
    return noOfRowsAffected > 0;
  }

  @override
  Future<bool> updateActivity(ActivityModel activityModel) async {
    log('Update Db Running', name: _fileName);
    log('Hour : ${activityModel.endTime.hour}', name: _fileName);
    log('Minute : ${activityModel.endTime.minute}', name: _fileName);
    log('Second : ${activityModel.endTime.second}', name: _fileName);
    log('Milliseconds : ${activityModel.endTime.millisecondsSinceEpoch}',  name: _fileName);
    var noOfRowsAffected = await db.update(
      ActivityModel.tableName,
      {
        ActivityModel.endTimeCol: activityModel.endTime.millisecondsSinceEpoch,
        ActivityModel.durationCol: activityModel.duration.inMilliseconds,
      },
      where: '${ActivityModel.dateCol}=?',
      whereArgs: [
        activityModel.date.toKey(),
      ],
    );
    log('No of Rows in Updated : $noOfRowsAffected', name: _fileName);
    return noOfRowsAffected > 0;
  }
}
