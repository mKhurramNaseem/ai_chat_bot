import 'dart:developer';

import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/activity/domain/entities/activity.dart';

class ApActivityList extends StatelessWidget {
  final List<Activity> activites;
  const ApActivityList({
    super.key,
    required this.activites,
  });

  @override
  Widget build(BuildContext context) {
    log('List Length : ${activites.length}', name: 'ap_activity_list.dart');
    return Column(
      children: [
        for (int i = 0; i < 3; i++)
          Builder(
            builder: (context) {
              if (i < activites.length) {
                return Expanded(
                  child: ApDetailTile(
                    activity: activites[i],
                  ),
                );
              }
              return const Expanded(
                child: SizedBox(),
              );
            },
          ),
      ],
    );
  }
}
