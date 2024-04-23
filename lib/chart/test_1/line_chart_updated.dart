// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'dart:developer';
import 'dart:math';
import 'package:flutter/material.dart';
// import library mac_line_chart from stack_chart Package
import 'package:fl_chart/fl_chart.dart';
import 'package:http/http.dart' as http;

class SingleLineChart extends StatefulWidget {
  SingleLineChart({Key? key}) : super(key: key);
  // Labels Array

  @override
  State<SingleLineChart> createState() => _SingleLineChartState();
}

class _SingleLineChartState extends State<SingleLineChart> {
  List<FlSpot> singleLineChartData = [];

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

  /// The initState function in Dart fetches data for a specified period
  /// and then calls the super class's initState method.
  @override
  void initState() {
    /// The fetchChartData function in Dart fetches data for a specified period.
    fetchChartData(period);
    super.initState();
  }

  /// dummyData1 is a dummy data for testing purposes
  final List<FlSpot> dummyData1 = List.generate(8, (index) {
    return FlSpot(index.roundToDouble(), index * Random().nextDouble() * 10);
  });

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
                lineBarsData: [
                  // The red line
                  LineChartBarData(
                    spots: singleLineChartData,
                    // spots: dummyData1,
                    isCurved: true,
                    barWidth: 3,
                    color: Colors.pinkAccent,
                  ),
                ],
              ),
            ),
          ),
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
          'https://cloudkitchen.macincode.in/api/v1/single_line_chart?period=$period'));
      debugPrint(response.request!.url.toString());
      if (response.statusCode == 200) {
        /// Request was successful, parse the response data
        final responseData = json.decode(response.body);
        final List<dynamic> data = responseData['data'];
        print("kkkkkkkkkkkk");
        print(data);
        print("kkkkkkkkkkkk");

        /// Convert data to a list of PieChartSectionData
        List<FlSpot> chartData = data.map((item) {
          // Try to convert x and y values to double
        
            double xValue = double.parse(item[0]);
            double yValue = double.parse(item[1]);
            // Return an FlSpot object with the parsed x and y values
            return FlSpot(xValue, yValue);
          
        }).toList();
        setState(() {
          singleLineChartData = chartData;
        });
      } else {
        // Request failed
        debugPrint('Request failed with status: ${response.statusCode}');
      }
      debugPrint(singleLineChartData.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}