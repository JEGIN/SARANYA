

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';





class LineChartWidgetUpdated extends StatefulWidget {
  const LineChartWidgetUpdated({Key? key}) : super(key: key);

  @override
  State<LineChartWidgetUpdated> createState() => _LineChartWidgetUpdatedState();
}
class _LineChartWidgetUpdatedState extends State<LineChartWidgetUpdated> {
  final List<FlSpot> data1 = [
    FlSpot(0, 10),
    FlSpot(1, 20),
    FlSpot(2, 15),
    FlSpot(3, 25),
    FlSpot(4, 30),
    FlSpot(5, 35),
    FlSpot(6, 50), // Updated to be consistent with data2 and others
  ];

  final List<FlSpot> data2 = [
    FlSpot(0, 22),
    FlSpot(1.5, 25),
    FlSpot(2.3, 33),
    FlSpot(3, 35),
    FlSpot(4, 40),
    FlSpot(5, 45),
  ];
  final List<FlSpot> data3 = [
    FlSpot(0, 22),
    FlSpot(1.5, 25),
    FlSpot(2.3, 33),
    FlSpot(3, 35),
    FlSpot(4, 40),
    FlSpot(5, 45),
  ];
  final List<FlSpot> data4 = [
    FlSpot(0, 22),
    FlSpot(1.5, 25),
    FlSpot(2.3, 33),
    FlSpot(3, 35),
    FlSpot(4, 40),
    FlSpot(5, 45),
  ];

  late double minX, maxX, minY, maxY;

  @override
  void initState() {
    super.initState();
    // Calculate the dynamic values for minX, maxX, minY, and maxY
    calculateChartLimits();
  }

  void calculateChartLimits() {
    List<List<FlSpot>> allDataSets = [data1, data2, data3, data4];

    // Initialize the min and max values
    minX = double.infinity;
    maxX = double.negativeInfinity;
    minY = double.infinity;
    maxY = double.negativeInfinity;

    // Iterate through all data sets
    for (List<FlSpot> dataSet in allDataSets) {
      for (FlSpot spot in dataSet) {
        if (spot.x < minX) {
          minX = spot.x;
        }
        if (spot.x > maxX) {
          maxX = spot.x;
        }
        if (spot.y < minY) {
          minY = spot.y;
        }
        if (spot.y > maxY) {
          maxY = spot.y;
        }
      }
    }

    // Add some padding to maxY to improve the chart's appearance
    maxY += 10; // Adjust this value as needed for padding
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 400,
          height: 300,
          child: LineChart(
            LineChartData(
              minX: minX,
              maxX: maxX,
              minY: minY,
              maxY: maxY,
              lineBarsData: [
                LineChartBarData(
                  spots: data1,
                  isCurved: true,
                  color: Colors.red, // Color for the first line
                  barWidth: 4,
                  isStrokeCapRound: true,
                  belowBarData: BarAreaData(show: false),
                ),
                LineChartBarData(
                  spots: data2,
                  isCurved: true,
                  color: Colors.blue, // Color for the second line
                  barWidth: 4,
                  isStrokeCapRound: true,
                  belowBarData: BarAreaData(show: false),
                ),
                LineChartBarData(
                  spots: data3,
                  isCurved: true,
                  color: Colors.green, // Color for the third line
                  barWidth: 4,
                  isStrokeCapRound: true,
                  belowBarData: BarAreaData(show: false),
                ),
                LineChartBarData(
                  spots: data4,
                  isCurved: true,
                  color: Colors.purple, // Color for the fourth line
                  barWidth: 4,
                  isStrokeCapRound: true,
                  belowBarData: BarAreaData(show: false),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
