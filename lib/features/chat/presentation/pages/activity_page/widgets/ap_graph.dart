import 'dart:developer';

import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/activity_page/widgets/ap_base_widget.dart';
import 'package:fl_chart/fl_chart.dart';

class ApGraph extends StatelessWidget {
  const ApGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return ApBaseWidget(
      child: LineChart(
        LineChartData(
          minX: 1,
          minY: 1,
          maxX: 7,
          maxY: 6,
          titlesData: FlTitlesData(
            show: true,
            leftTitles: AxisTitles(
              axisNameSize: 2,
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                minIncluded: true,
                reservedSize: 30,
                getTitlesWidget: (value, meta) {
                  log(value.toString());
                  return SideTitleWidget(
                      axisSide: AxisSide.left,
                      fitInside: SideTitleFitInsideData.fromTitleMeta(
                        meta,
                        enabled: true,
                        distanceFromEdge: 1,
                      ),
                      child: Text('${value.toInt()}h'));
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
                      child: Text(getWeekDayFromNumber(value.toInt())));
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
                const FlSpot(
                  1,
                  5,
                ),
                const FlSpot(2, 4),
                const FlSpot(3, 2),
                const FlSpot(4, 5),
                const FlSpot(5, 2),
                const FlSpot(6, 1.5),
                const FlSpot(7, 4),
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
}
