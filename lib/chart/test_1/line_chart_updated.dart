import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class LineChartWidgetUpdated extends StatefulWidget {
  const LineChartWidgetUpdated({Key? key}) : super(key: key);

  @override
  State<LineChartWidgetUpdated> createState() => _LineChartWidgetUpdatedState();
}

class _LineChartWidgetUpdatedState extends State<LineChartWidgetUpdated> {
  // late double minX, maxX, minY, maxY;

  // List<LineChartBarData> dataOfLineChart = [];

  // List<Color> colors = [Colors.red, Colors.green, Colors.purple];

  // List<FlSpot> data1 = [];

  // List<FlSpot> data2 = [];

  // List<FlSpot> data3 = [];

  // List<FlSpot> dataPoints = [];

  // List<List<FlSpot>> allDataSets = [];

  // @override
  // void initState() {
  //   // calculateChartLimits();
  //   this.data1 = generateRandomDataPoints(280);
  //   // print(this.data1);
  //   this.data2 = generateRandomDataPoints(320);
  //   // print(this.data2);
  //   this.data3 = generateRandomDataPoints(199);
  //   // print(this.data3);
  //   super.initState();

  //   // Calculate the dynamic values for minX, maxX, minY, and maxY
  //   allDataSets = [this.data1, this.data2, this.data3];
  //   print('************');
  //   print(allDataSets);
  //   print('************');

  //   for (int i = 0; i < allDataSets.length; i++) {
  //     LineChartBarData lineChartBarData = LineChartBarData(
  //       spots: allDataSets[i],
  //       isCurved: true,
  //       color: colors[i], // Assign a color from the list
  //       barWidth: 2,
  //       // curveSmoothness: 1,
  //       isStrokeCapRound: true,
  //       belowBarData: BarAreaData(show: true),
  //     );

  //     // Add the line chart data to the list
  //     dataOfLineChart.add(lineChartBarData);
  //   }
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Center(
  //       child: Container(
  //         width: 400,
  //         height: 300,
  //         child: LineChart(
  //           LineChartData(
  //             minX: 0,
  //             maxX: 365,
  //             minY: 0,
  //             maxY: 9000,
  //             lineBarsData: dataOfLineChart,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // calculateChartLimits() {
  //   // Initialize limits with extreme values
  //   minX = 0;
  //   maxX = 365;
  //   minY = 0;
  //   maxY = 9000;

  //   // Iterate through all data sets
  //   for (var dataSet in allDataSets) {
  //     // Iterate through each data point in the current data set
  //     for (var point in dataSet) {
  //       // Update minX and maxX based on X values
  //       if (point.x < minX) {
  //         minX = point.x;
  //       }
  //       if (point.x > maxX) {
  //         maxX = point.x;
  //       }

  //       // Update minY and maxY based on Y values
  //       if (point.y < minY) {
  //         minY = point.y;
  //       }
  //       if (point.y > maxY) {
  //         maxY = point.y;
  //       }
  //     }
  //   }
  // }

  // List<FlSpot> generateRandomDataPoints(int n) {
  //   // Create an instance of the Random class
  //   Random random = Random();

  //   // Define the minimum and maximum values for the range
  //   double min = 0;
  //   double max = 8500;

  //   // Create an empty list to hold the data points

  //   // Generate 30 random data points
  //   for (int i = 1; i < n; i++) {
  //     // Generate a random X value within the range
  //     double x = min + (random.nextDouble() * (max - min));

  //     // Generate a random Y value within the range
  //     double y = min + (random.nextDouble() * (max - min));

  //     // Create a FlSpot with the generated X and Y values
  //     FlSpot dataPoint = FlSpot(x.roundToDouble(), y.roundToDouble());

  //     // Add the data point to the list
  //     this.dataPoints.add(dataPoint);
  //   }

  //   // Return the list of data points
  //   return dataPoints;
  // }
  // Generate some dummy data for the cahrt
  // This will be used to draw the red line
  final List<FlSpot> dummyData1 = List.generate(8, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

  // This will be used to draw the orange line
  final List<FlSpot> dummyData2 = List.generate(8, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

  // This will be used to draw the blue line
  final List<FlSpot> dummyData3 = List.generate(8, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          child: LineChart(
            LineChartData(
              titlesData: FlTitlesData(show: false),
              borderData: FlBorderData(show: false),
              lineBarsData: [
                // The red line
                LineChartBarData(
                  spots: dummyData1,
                  isCurved: true,
                  barWidth: 3,
                  color: Colors.indigo,
                ),
                // The orange line
                LineChartBarData(
                  spots: dummyData2,
                  isCurved: true,
                  barWidth: 3,
                  color: Colors.red,
                ),
                // The blue line
                LineChartBarData(
                  spots: dummyData3,
                  isCurved: false,
                  barWidth: 3,
                  color: Colors.blue,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
