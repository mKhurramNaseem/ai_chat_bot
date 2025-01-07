import 'dart:developer';
import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/activity/domain/entities/activity.dart';
import 'package:fl_chart/fl_chart.dart';

class ApGraph extends StatelessWidget {
  final List<Activity> activites;
  const ApGraph({
    super.key,
    required this.activites,
  });

  @override
  Widget build(BuildContext context) {
    var list =
        activites.where((element) => isPreviousWeek(element.date)).toList();
    return ApBaseWidget(
      child: LineChart(
        LineChartData(
          minX: 1,
          minY: 0,
          maxX: 7,
          maxY: 200,
          titlesData: FlTitlesData(
            show: true,
            leftTitles: AxisTitles(
              axisNameWidget:
                  Text('min', style: Theme.of(context).textTheme.bodyMedium),
              axisNameSize: 2,
              sideTitles: SideTitles(
                showTitles: true,
                interval: 40,
                minIncluded: true,
                reservedSize: 35,
                getTitlesWidget: (value, meta) {
                  log(value.toString());
                  return SideTitleWidget(
                      axisSide: AxisSide.left,
                      fitInside: SideTitleFitInsideData.fromTitleMeta(
                        meta,
                        enabled: true,
                        distanceFromEdge: 2,
                      ),
                      child: Text('${value.toInt()}'));
                },
              ),
            ),
            bottomTitles: AxisTitles(
              axisNameSize: 2,
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                reservedSize: 30,
                getTitlesWidget: (value, meta) {
                  return SideTitleWidget(
                    axisSide: AxisSide.left,
                    child: Text(
                      getWeekDayFromNumber(
                        value.toInt(),
                      ),
                    ),
                  );
                },
              ),
            ),
            rightTitles: const AxisTitles(),
            topTitles: const AxisTitles(),
          ),
          borderData: FlBorderData(
            show: false,
          ),
          gridData: const FlGridData(
            drawHorizontalLine: false,
            drawVerticalLine: false,
          ),
          lineBarsData: [
            LineChartBarData(
              color: Theme.of(context).colorScheme.primary,
              preventCurveOverShooting: true,
              dotData: const FlDotData(show: false),
              isCurved: true,
              isStrokeCapRound: true,
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).colorScheme.onTertiaryFixed,
                    Theme.of(context).colorScheme.onTertiaryFixedVariant,
                  ],
                ),
              ),
              barWidth: 5,
              isStrokeJoinRound: true,
              // preventCurveOverShooting: true,
              spots: [
                for (int weekDay = 1; weekDay < 7; weekDay++)
                  ...list
                      .where(
                        (element) => element.date.weekday == weekDay,
                      )
                      .map(
                        (e) => FlSpot(
                          weekDay.toDouble(),
                          e.duration.inMinutes.toDouble(),
                        ),
                      ),
              ],
            ),
          ],
        ),
        duration: const Duration(milliseconds: 150), // Optional
        curve: Curves.easeInCubic,
      ),
    );
  }

  String getWeekDayFromNumber(int number) {
    return switch (number) {
      1 => 'Mon',
      2 => 'Tue',
      3 => 'Wed',
      4 => 'Thu',
      5 => 'Fri',
      6 => 'Sat',
      7 => 'Sun',
      _ => '',
    };
  }

  bool isPreviousWeek(DateTime dateTime) {
    var lastPossibleDate = DateTime.now().subtract(const Duration(days: 7));
    return dateTime.isAfter(lastPossibleDate);
  }
}
