import 'dart:math';

import 'package:fl_chart/fl_chart.dart';

import '../../global/app_urls.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MultiLineChartNew extends StatefulWidget {
  const MultiLineChartNew({Key? key}) : super(key: key);
  @override
  State<MultiLineChartNew> createState() => _MultiLineChartNewState();
}

class _MultiLineChartNewState extends State<MultiLineChartNew> {
  List<List<FlSpot>> multiLineChartData = [];

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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: MediaQuery.of(context).size.width * 0.95,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: LineChart(
              LineChartData(
                titlesData:  FlTitlesData(
                  bottomTitles: AxisTitles(
                      // axisNameWidget: Text('Today'),
                      ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                    // axisNameSize: 14,
                    axisNameWidget: Text(
                      'in USD',
                      // textAlign: TextAlign.center,
                      // style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                backgroundColor: Colors.transparent,
                lineBarsData: buildLineChartData(multiLineChartData),
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
          'https://cloudkitchen.macincode.in/api/v1/multi_line_chart?period=$period'));
      debugPrint(response.request!.url.toString());
      if (response.statusCode == 200) {
        /// Request was successful, parse the response data
        final responseData = json.decode(response.body);
        final List<dynamic> data = responseData['data'];

        // debugPrint('*************');
        // print(data);
        // debugPrint('*************');
        multiLineChartData = [];
        for (var i = 0; i < data.length; i++) {
          Map<String, dynamic> dataSet = data[i];
          List<dynamic> points = dataSet.values.first;
          List<FlSpot> lineData = [];
          for (var j = 0; j < points.length; j++) {
            double x = double.parse(points[j]['x'].toString());
            double y = double.parse(points[j]['y'].toString());
            lineData.add(FlSpot(x, y));
          }
          multiLineChartData.add(lineData);
        }

        // debugPrint('*************');
        // print(multiLineChartData);
        // debugPrint('*************');

        Future.delayed(const Duration(milliseconds: 500), () {
          setState(() {
            multiLineChartData = multiLineChartData;
          });
          // loopCall(multiLineChartData);
        });
      } else {
        // Request failed
        debugPrint('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // void loopCall(List<List<FlSpot>> multiLineChartData) {
  //   // print data using for loop
  //   for (var i = 0; i < multiLineChartData.length; i++) {
  //     debugPrint(multiLineChartData[i].toString());
  //   }
  // }

  /// The function `buildLineChartData` generates a list of `LineChartBarData`
  /// objects with random colors for each set of data points provided.
  ///
  /// Args:
  ///   multiLineChartData (List<List<FlSpot>>): The `multiLineChartData`
  /// parameter is a list of lists of `FlSpot` objects. Each inner list
  /// represents the data points for a single line on the line chart. The outer
  /// list contains multiple inner lists, each representing a different
  /// line on the chart.
  ///
  /// Returns:
  ///   The function `buildLineChartData` returns a list of `LineChartBarData`
  /// objects. Each `LineChartBarData` object represents a line chart bar with
  /// specific data points, curve settings, bar width, and color. The function
  /// generates these objects based on the input `multiLineChartData`, which is
  /// a list of lists containing data points for multiple lines on the
  /// chart.
  List<LineChartBarData> buildLineChartData(
      List<List<FlSpot>> multiLineChartData) {
    return List<LineChartBarData>.generate(
      multiLineChartData.length,
      (index) {
        // double hueValue = 360.0 * (index / multiLineChartData.length);
        // Color color = HSVColor.fromAHSV(1.0, hueValue, 1.0, 1.0).toColor();
        // Color color = Color.fromARGB(
        //   255, // alpha value (fully opaque)
        //   (255 * (1.0 - (index / multiLineChartData.length)))
        //       .round(), // red value
        //   (255 * (index / multiLineChartData.length)).round(), // green value
        //   (255 * (index / multiLineChartData.length)).round(), // blue value
        // );

        Color color = Color.fromARGB(
          255, // alpha value (fully opaque)
          Random().nextInt(256), // random red value between 0 and 255
          Random().nextInt(256), // random green value between 0 and 255
          Random().nextInt(256), // random blue value between 0 and 255
        );
        return LineChartBarData(
          spots: multiLineChartData[index],
          isCurved: false,
          barWidth: 3,
          // dotData: FlDotData(show: false),
          // dynamic colors based on the index
          color: color,
        );
      },
    );
  }
}