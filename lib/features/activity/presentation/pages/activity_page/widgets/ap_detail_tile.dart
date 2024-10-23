import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/activity/domain/entities/activity.dart';
import 'package:intl/intl.dart';

class ApDetailTile extends StatelessWidget {
  static const _startSpace = 3,
      _middleSpace = 3,
      _tileTextsFlex = 71,
      _imageFlex = 20;
  final Activity activity;
  const ApDetailTile({
    super.key,
    required this.activity,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ApBaseWidget(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              height: constraints.maxHeight,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  const Spacer(
                    flex: _startSpace,
                  ),
                  Expanded(
                    flex: _imageFlex,
                    child: LayoutBuilder(builder: (context, constraints) {
                      return Icon(
                        Icons.access_time_filled_rounded,
                        color: Theme.of(context).colorScheme.primary,
                        size: constraints.maxHeight * 0.6,
                      );
                    }),
                  ),
                  const Spacer(
                    flex: _middleSpace,
                  ),
                  Expanded(
                    flex: _tileTextsFlex,
                    child: ApDetailTileTexts(
                      activity: activity,
                    ),
                  ),
                  const Spacer(
                    flex: _startSpace,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ApDetailTileTexts extends StatelessWidget {
  static const _titleTextFlex = 47, _spacer = 6, _messageFlex = 47;
  static const _titleFontSize = 0.4, _messageFontSize = 0.3;
  static const _title = AppConstants.botName;
  static const _maxLines = 2;
  final Activity activity;
  const ApDetailTileTexts({
    super.key,
    required this.activity,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: _titleTextFlex,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  '$_title-${DateFormat('MMM d, y').format(
                    activity.date,
                  )}',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: constraints.maxHeight * _titleFontSize,
                      ),
                ),
              );
            },
          ),
        ),
        const Spacer(
          flex: _spacer,
        ),
        Expanded(
          flex: _messageFlex,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Align(
                alignment: Alignment.topLeft,
                child: Text(
                  '${DateFormat(DateFormat.HOUR_MINUTE_SECOND).format(activity.startTime)} - ${DateFormat(DateFormat.HOUR_MINUTE_SECOND).format(activity.endTime)} (${activity.duration.inMinutes} minutes)',
                  maxLines: _maxLines,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: constraints.maxHeight * _messageFontSize,
                      ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
