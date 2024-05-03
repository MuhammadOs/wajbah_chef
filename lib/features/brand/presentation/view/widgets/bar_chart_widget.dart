import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:wajbah_chef/core/constants/constants.dart';
import 'package:wajbah_chef/core/styles.dart';
import 'package:wajbah_chef/features/brand/data/brand_data.dart';

class BarChartSample2 extends StatefulWidget {
  final int tabIndex;

  const BarChartSample2({Key? key, required this.tabIndex}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BarChartSample2State();
}

class BarChartSample2State extends State<BarChartSample2> {
  final double width = 7;
  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    rawBarGroups = getBarChartDataForTab(widget.tabIndex);
    showingBarGroups = rawBarGroups;
  }

  @override
  void didUpdateWidget(covariant BarChartSample2 oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.tabIndex != widget.tabIndex) {
      setState(() {
        rawBarGroups = getBarChartDataForTab(widget.tabIndex);
        showingBarGroups = rawBarGroups;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ColoredTitles(
              tab: widget.tabIndex == 0
                  ? 'Day'
                  : widget.tabIndex == 1
                      ? 'Week'
                      : widget.tabIndex == 2
                          ? 'Month'
                          : 'Year',
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: BarChart(
                BarChartData(
                  maxY: 20,
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      getTooltipColor: ((group) {
                        return Colors.grey;
                      }),
                      getTooltipItem: (a, b, c, d) => null,
                    ),
                    touchCallback: (FlTouchEvent event, response) {
                      if (response == null || response.spot == null) {
                        setState(() {
                          touchedGroupIndex = -1;
                          showingBarGroups = List.of(rawBarGroups);
                        });
                        return;
                      }

                      touchedGroupIndex = response.spot!.touchedBarGroupIndex;

                      setState(() {
                        if (!event.isInterestedForInteractions) {
                          touchedGroupIndex = -1;
                          showingBarGroups = List.of(rawBarGroups);
                          return;
                        }
                        showingBarGroups = List.of(rawBarGroups);
                        if (touchedGroupIndex != -1) {
                          var sum = 0.0;
                          for (final rod
                              in showingBarGroups[touchedGroupIndex].barRods) {
                            sum += rod.toY;
                          }
                          final avg = sum /
                              showingBarGroups[touchedGroupIndex]
                                  .barRods
                                  .length;

                          showingBarGroups[touchedGroupIndex] =
                              showingBarGroups[touchedGroupIndex].copyWith(
                            barRods: showingBarGroups[touchedGroupIndex]
                                .barRods
                                .map((rod) {
                              return rod.copyWith(
                                  toY: avg, color: Color(0xff0062FF));
                            }).toList(),
                          );
                        }
                      });
                    },
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: bottomTitles,
                        reservedSize: 42,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 35,
                        interval: 1,
                        getTitlesWidget: leftTitles,
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  barGroups: showingBarGroups,
                  gridData: const FlGridData(show: false),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    if (value == 0) {
      text = '\$0';
    } else if (value == 10) {
      text = '\$250';
    } else if (value == 19) {
      text = '\$500';
    } else {
      return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(text, style: style),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = widget.tabIndex == 0
        ? <String>[
            'Sat',
            'Sun',
            'Mon',
            'Tue',
            'Wed',
            'Thu',
            'Fri',
          ]
        : widget.tabIndex == 1
            ? <String>[
                'Week 1',
                'Week 2',
                'Week 3',
                'Week 4',
              ]
            : widget.tabIndex == 2
                ? <String>[
                    'Jan',
                    'Feb',
                    'Mar',
                    'Apr',
                    'May',
                    'Jun',
                    'Jul',
                  ]
                : <String>[
                    '2017',
                    '2018',
                    '2019',
                    '2020',
                    '2021',
                    '2022',
                    '2023',
                  ];

    final Widget text = Text(
      titles[value.toInt()],
      style: const TextStyle(
        color: Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16, //margin top
      child: text,
    );
  }
}

class ColoredTitles extends StatelessWidget {
  const ColoredTitles({
    super.key,
    required this.tab,
  });
  final String tab;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const CustomDot(color: 0xff0062FF),
        const SizedBox(
          width: 8,
        ),
        Text('This $tab', style: Styles.hint.copyWith(color: wajbah_black)),
        const SizedBox(
          width: 50,
        ),
        const CustomDot(color: 0xff3DD598),
        const SizedBox(
          width: 8,
        ),
        Text('Last $tab', style: Styles.hint.copyWith(color: wajbah_black)),
      ],
    );
  }
}

class CustomDot extends StatelessWidget {
  const CustomDot({Key? key, required this.color}) : super(key: key);
  final int color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(color),
      ),
      width: 10,
      height: 10,
    );
  }
}
