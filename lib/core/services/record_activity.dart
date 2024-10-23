import 'dart:async';

import 'package:ai_chat_bot/features/activity/domain/entities/activity.dart';
import 'package:ai_chat_bot/features/activity/domain/usecase/record_activity_usecase.dart';
import 'package:ai_chat_bot/injection_container.dart';

void recordActivity() {
  var duration = const Duration(seconds: 15);
  var recordActivityUseCase = sl<RecordActivityUsecase>();
  Timer.periodic(
    duration,
    (timer) {
      recordActivityUseCase(Activity(
          startTime: DateTime.now(),
          endTime: DateTime.now(),
          date: DateTime.now(),
          duration: duration));
    },
  );
}
