import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

List<BarChartGroupData> getBarChartDataForTab(int tabIndex) {
  // Define your data for different tabs here
  switch (tabIndex) {
    case 0: // Day
      return getDayChartData();
    case 1: // Week
      return getWeekChartData();
    case 2: // Month
      return getMonthChartData();
    case 3: // Year
      return getYearChartData();
    default:
      return getMonthChartData(); // Default to Month data
  }
}

List<BarChartGroupData> getDayChartData() {
  // Define your data for Day tab
  // Example:
  return [
    makeGroupData(0, 5, 10),
    makeGroupData(1, 11, 15),
    makeGroupData(2, 3, 16),
    makeGroupData(3, 7, 18),
    makeGroupData(4, 11, 19),
    makeGroupData(5, 12, 14),
  ];
}

List<BarChartGroupData> getWeekChartData() {
  return [
    makeGroupData(0, 20, 22),
    makeGroupData(1, 22, 15),
    makeGroupData(2, 3, 16),
    makeGroupData(3, 7, 18),
  ];
}

List<BarChartGroupData> getMonthChartData() {
  return [
    makeGroupData(0, 17, 20),
    makeGroupData(1, 13, 14),
    makeGroupData(2, 3, 16),
    makeGroupData(3, 7, 18),
    makeGroupData(4, 11, 19),
    makeGroupData(5, 12, 14),
  ];
}

List<BarChartGroupData> getYearChartData() {
  return [
    makeGroupData(3, 7, 18),
    makeGroupData(4, 11, 19),
    makeGroupData(5, 12, 14),
    makeGroupData(0, 20, 15),
    makeGroupData(1, 22, 3),
    makeGroupData(2, 3, 8),
  ];
}

BarChartGroupData makeGroupData(int x, double y1, double y2) {
  return BarChartGroupData(
    barsSpace: 4,
    x: x,
    barRods: [
      BarChartRodData(toY: y1, color: Color(0xff3DD598)
          // Color for left bar
          ),
      BarChartRodData(toY: y2, color: Color(0xff0062FF)
          // Color for right bar
          ),
    ],
  );
}
