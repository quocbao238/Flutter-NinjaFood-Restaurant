import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_admin/home/controllers/admin_home_controller.dart';
import 'package:ninjafood/app/features/role_admin/home/presentation/view/mobile/chart_data/bar_chart_group_data.dart';
import 'package:ninjafood/app/helper/helper.dart';

class ChartViewData extends StatefulWidget {
  final List<ChartData> chartData;
  final String title;
  final FilterChart filterChart;

  ChartViewData({Key? key, required this.chartData, required this.title, required this.filterChart}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ChartViewDataState();
}

class ChartViewDataState extends State<ChartViewData> {
  int touchedIndex = -1;
  final today = DateTime.now();

  final Color touchedBarColor = Colors.amberAccent;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final Color barBackgroundColor =
        isDarkMode ? ThemeColors.backgroundTextFormDark() : context.theme.colorScheme.onPrimary;

    if (widget.chartData.length == 0) return const SizedBox();

    final maxY = widget.chartData.map((e) => e.value).reduce((value, element) => value > element ? value : element);

    BarChartGroupData makeGroupData(ChartData chartData, {bool isTouched = false, List<int> showTooltips = const []}) {
      final isToday = chartData.dateTime.day == today.day &&
          chartData.dateTime.month == today.month &&
          chartData.dateTime.year == today.year;
      return BarChartGroupData(
        x: chartData.index,
        barRods: [
          BarChartRodData(
            toY: chartData.value,
            // isTouched
            //     ? chartData.value + (chartData.value * 10 / 100)
            //     : chartData.value,
            color: isToday
                ? context.theme.colorScheme.primary
                : isTouched
                    ? context.theme.colorScheme.primaryContainer
                    : context.theme.colorScheme.secondary,
            width: MediaQuery.of(context).size.width / widget.chartData.length / 3,
            borderSide: BorderSide(color: Colors.transparent, width: 0),
          ),
        ],
        showingTooltipIndicators: showTooltips,
      );
    }

    final controller = Get.find<AdminHomeController>();

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: Theme.of(context).shadowColor.withOpacity(0.25), blurRadius: 4, offset: Offset(0, 4))
          ],
          color: barBackgroundColor),
      margin: EdgeInsets.only(bottom: AppGapSize.small.size),
      child: AppPadding.medium(
        child: AspectRatio(
          aspectRatio: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              AppPadding(
                padding: AppEdgeInsets.only(bottom: AppGapSize.medium),
                child: Row(
                  children: [
                    Expanded(
                        child: AppText.titleMedium(
                            text: widget.title, fontWeight: FontWeight.bold, maxLines: 1, textAlign: TextAlign.start)),
                    // Filter button
                    DropdownButton<FilterChart>(
                        items: FilterChart.values
                            .map((e) => DropdownMenuItem(child: AppText.titleSmall(text: e.translation.tr), value: e))
                            .toList(),
                        value: widget.filterChart,
                        icon: Icon(Icons.filter_list, color: context.theme.textTheme.bodySmall!.color),
                        underline: SizedBox(),
                        onChanged: (val) => controller.onFilterRevenueChart(val!))
                  ],
                ),
              ),
              Expanded(
                child: BarChart(
                  BarChartData(
                    barTouchData: BarTouchData(
                      enabled: true,
                      touchTooltipData: BarTouchTooltipData(
                        tooltipBgColor: context.theme.colorScheme.primaryContainer,
                        tooltipPadding: const EdgeInsets.all(8),
                        tooltipMargin: 8,
                        getTooltipItem: (group, groupIndex, rod, rodIndex) {
                          return BarTooltipItem(
                            widget.chartData[group.x.toInt()].toolTip + '\n',
                            TextStyle(color: context.theme.textTheme.bodySmall!.color, fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                text: formatPriceToVND(rod.toY) + ' VND',
                                style: TextStyle(
                                    color: context.theme.textTheme.bodySmall!.color,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          );
                        },
                      ),
                      touchCallback: (FlTouchEvent event, barTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              barTouchResponse == null ||
                              barTouchResponse.spot == null) {
                            touchedIndex = -1;
                            return;
                          }
                          touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
                        });
                      },
                    ),
                    titlesData: FlTitlesData(
                        show: true,
                        bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (val, title) => SideTitleWidget(
                                      axisSide: title.axisSide,
                                      child: AppText.bodySmall(text: widget.chartData[val.toInt()].bottomTitle),
                                    ))),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 42,
                            getTitlesWidget: (val, title) => SideTitleWidget(
                              axisSide: title.axisSide,
                              child: val % 500 != 0
                                  ? SizedBox()
                                  : AppText.bodySmall(
                                      text: formatVND(val.toInt()), maxLines: 1, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false))),
                    borderData: FlBorderData(show: false),
                    barGroups:
                        widget.chartData.map((e) => makeGroupData(e, isTouched: e.index == touchedIndex)).toList(),
                    gridData: FlGridData(
                        show: true,
                        checkToShowVerticalLine: (value) => false,
                        checkToShowHorizontalLine: (value) => value % 1 == 0),
                    maxY: maxY,
                  ),
                  swapAnimationDuration: const Duration(milliseconds: 500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String formatVND(int value) {
  if (value < 1000) {
    return value.toString();
  } else if (value < 1000000) {
    return (value / 1000).toStringAsFixed(1).replaceAll('.0', '') + 'K';
  } else if (value < 1000000000) {
    return (value / 1000000).toStringAsFixed(1).replaceAll('.0', '') + 'M';
  } else if (value < 1000000000000) {
    return (value / 1000000000).toStringAsFixed(1).replaceAll('.0', '') + 'B';
  } else {
    return (value / 1000000000000).toStringAsFixed(1).replaceAll('.0', '') + 'T';
  }
}
