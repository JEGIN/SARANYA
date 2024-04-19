// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'dart:developer';
import 'dart:math';
import 'package:flutter/material.dart';
// import library mac_line_chart from stack_chart Package
import 'package:fl_chart/fl_chart.dart';
import 'package:http/http.dart' as http;

class MultiLineScreenWidget extends StatefulWidget {
  MultiLineScreenWidget({Key? key}) : super(key: key);
  // Labels Array

  @override
  State<MultiLineScreenWidget> createState() => _MultiLineScreenWidgetState();
}

class _MultiLineScreenWidgetState extends State<MultiLineScreenWidget> {
  List<List<FlSpot>> multiLineChartData = [];
  List<LineChartBarData> lineChartData = [];
  List<Color> colors = [
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.greenAccent
  ];

  /// The variable `selectedIndex` to store the selected index of the chart.
  int selectedIndex = 0;

  /// The List `periods` to store the periods of the chart.
  List periods = [
    {"period": "1D"},
    {"period": "1W"},
    {"period": "1M"},
    {"period": "1Y"},
    {"period": "CFY"},
    {"period": "ALL"},
  ];

  /// The variable `period` to store the selected period of the chart.
  dynamic period = '1D';

  List<Color> colorList = [Colors.green, Colors.red, Colors.blue];

  List<LineChartBarData> lineChartDataNew = [];
  List<List<FlSpot>> dataList = [];

  /// The initState function in Dart fetches data for a specified period
  /// and then calls the super class's initState method.
  @override
  void initState() {
    /// The fetchChartData function in Dart fetches data for a specified period.
    fetchChartData(period);
    // chartFunction();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: LineChart(
            LineChartData(
                titlesData: FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                backgroundColor: Colors.transparent,
                // lineBarsData: lineChartData
                lineBarsData: lineChartDataNew),
          )),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 28,
            child: ListView.separated(
              itemCount: periods.length,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      fetchChartData(periods[index]['period']);
                    });
                  },
                  child: Container(
                    width: 34,
                    decoration: BoxDecoration(
                      color: selectedIndex == index
                          ? Colors.black
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(3, 3, 3, 3),
                      child: Text(
                        periods[index]['period'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: selectedIndex == index
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (separatorBuilder, index) {
                return const SizedBox(
                  width: 22,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  /// This function ``fetchChartData`` fetches data from an API endpoint based
  /// on a specified
  /// period and updates the state with the response data for a bar chart.
  ///
  /// Args:
  ///   period: The `period` parameter in the `fetchChartData` function is used to
  /// specify the time period for which data should be fetched from the API.
  /// It is passed as a query parameter in the API request URL to retrieve
  /// specific data based on the provided period.
  Future<void> fetchChartData(period) async {
    debugPrint('inside API call');
    try {
      final response = await http.get(Uri.parse(
          'https://cloudkitchen.macincode.in/api/v1/multi_line_chart?period=$period'));
      debugPrint(response.request!.url.toString());
      if (response.statusCode == 200) {
        // Request was successful, parse the response data
        final responseData = json.decode(response.body);
        final List<dynamic> data = responseData['data'];


      

  for (var subList in data) {
    List<FlSpot> flSpotList = [];
    for (var point in subList) {
      // Convert the string values to double
      double x = double.parse(point[0]);
      double y = double.parse(point[1]);
      
      // Create an FlSpot object and add it to the list
      FlSpot flSpot = FlSpot(x, y);
      flSpotList.add(flSpot);
    }
    // Add the list of FlSpot objects to the final list
    dataList.add(flSpotList);
  }
  
 for (int i = 0; i < dataList.length; i++) {
      LineChartBarData lineData = LineChartBarData(
        isCurved: true,
        barWidth: 3,
        color: colorList[i],
        spots: dataList[i],
      );
      // Add the line data to the list
      lineChartDataNew.add(lineData);
    }


        
        setState(() {

        
        });
       
      } else {
        // Request failed
        debugPrint('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error occurred: $e');
    }
  }

  chartFunction() {
    /// Dummmy data for the chart
    final List<FlSpot> dummyData1 = List.generate(8, (index) {
      double value = index * Random().nextDouble() * 10;
      String formattedValue = value.toStringAsFixed(2);
      return FlSpot(index.roundToDouble(), double.parse(formattedValue));
    });

    // This will be used to draw the orange line
    final List<FlSpot> dummyData2 = List.generate(8, (index) {
      double value = index * Random().nextDouble() * 10;
      String formattedValue = value.toStringAsFixed(2);
      return FlSpot(index.roundToDouble(), double.parse(formattedValue));
    });

    // This will be used to draw the blue line
    final List<FlSpot> dummyData3 = List.generate(8, (index) {
      double value = index * Random().nextDouble() * 10;
      String formattedValue = value.toStringAsFixed(2);
      return FlSpot(index.roundToDouble(), double.parse(formattedValue));
    });
    print("dummyData1");
    print(dummyData1);
    print("dummyData2");
    print(dummyData2);
    print("dummyData3");
    print(dummyData3);
    lineChartDataNew.clear();
    dataList = [dummyData1, dummyData2, dummyData3];
    print("dataList");
    print(dataList);


    for (int i = 0; i < dataList.length; i++) {
      LineChartBarData lineData = LineChartBarData(
        isCurved: true,
        barWidth: 3,
        color: colorList[i],
        spots: dataList[i],
      );
      // Add the line data to the list
      lineChartDataNew.add(lineData);
    }
    print("gggggggggggggggggggg");
    print(lineChartDataNew);
    print("gggggggggggggggggggg");
    return lineChartDataNew;
  }
}
