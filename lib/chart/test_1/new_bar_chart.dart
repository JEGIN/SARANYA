import 'package:application1/global/app_urls.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class BarChartNN extends StatefulWidget {
  const BarChartNN({super.key});

  @override
  State<BarChartNN> createState() => _BarChartNNState();
}

class _BarChartNNState extends State<BarChartNN> {
  List<Map<String, dynamic>> barChatData = [];

  int selectedIndex = 0;

  List periods = [
    {
      "period": "1D",
    },
    {
      "period": "1W",
    },
    {
      "period": "1M",
    },
    {
      "period": "1Y",
    },
    {
      "period": "CFY",
    },
    {
      "period": "ALL",
    },
  ];

  dynamic apiEndPoint = '1D';
  @override
  void initState() {
    fetchData(apiEndPoint);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
            // height: 500,

            child: Column(
          children: [
            // Expanded(child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Container(
                    height: 26,
                    width: 26,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Income"),
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Container(
                    height: 26,
                    width: 26,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("expense")
                ]),
              ],
            ),
            // ),

            SizedBox(
              height: 20,
            ),
            Expanded(
                child: BarChart(
              // swapAnimationCurve : Curves.bounceIn,
              BarChartData(
                alignment: BarChartAlignment.spaceEvenly,
                maxY: getMaxValue(),
                minY: getMinValue(),
                baselineY: 0,
                barTouchData: BarTouchData(
                    enabled: true,
                    touchTooltipData: BarTouchTooltipData(
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        return BarTooltipItem(
                          rod.toY.toString(),
                          TextStyle(
                            color: rod.color,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                      tooltipBorder: BorderSide(color: Colors.grey, width: 1),
                      tooltipBgColor: Colors.white,
                      tooltipRoundedRadius: 10,
                      tooltipPadding: EdgeInsets.only(
                          top: 10, bottom: 10, left: 10, right: 10),
                      tooltipMargin: 10,
                    )),
                gridData: FlGridData(
                  show: false,
                  // checkToShowHorizontalLine: (value) => value % 2 == 0,
                  // checkToShowVerticalLine: (value) => value % 2 == 0,
                  // horizontalInterval: 5000,
                  // drawVerticalLine: true,
                  // drawHorizontalLine: true,
                  // verticalInterval: 5000,
                  // getDrawingVerticalLine: (value) {
                  //   return FlLine(
                  //     color: Colors.grey,
                  //     strokeWidth: 1,
                  //     dashArray: [5],
                  //   );
                  // },
                  // getDrawingHorizontalLine: (value) {
                  //   return FlLine(
                  //     color: Colors.grey,
                  //     strokeWidth: 1,
                  //     dashArray: [5],
                  //   );
                  // },
                ),
                titlesData: FlTitlesData(
                    topTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    leftTitles: AxisTitles(
                        // drawBehindEverything: true,
                        // axisNameSize: 12,
                        axisNameWidget: Text('Value'),
                        sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                          showTitles: false,
                          getTitlesWidget: (
                            value,
                            meta,
                          ) {
                            return Text(
                                '${barChatData[value.toInt()]["time"]}');
                          }

                          // (value) {
                          //   return data[value.toInt()]["time"];
                          // },
                          ),
                    )),
                borderData: FlBorderData(
                  show: false,
                ),
                barGroups: List.generate(barChatData.length, (index) {
                  double incomeBarChartParsedDouble = double.parse(
                      barChatData[index]["income"].replaceAll(',', ''));
                  double expenseBarChartParsedDouble = double.parse(
                      barChatData[index]["expense"].replaceAll(',', ''));
                  print(
                      'incomeBarChartParsedDouble: $incomeBarChartParsedDouble');
                  print(
                      'expenseBarChartParsedDouble: $expenseBarChartParsedDouble');

                  return BarChartGroupData(
                    groupVertically: false,
                    barsSpace: 2,
                    x: index,
                    barRods: [
                      BarChartRodData(
                        width: barChatData.length <= 5 ? 26 : 10,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4),
                        ),
                        toY: incomeBarChartParsedDouble,
                        color: Colors.green,
                      ),
                      BarChartRodData(
                        width: barChatData.length <= 5 ? 26 : 10,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4),
                        ),
                        toY: expenseBarChartParsedDouble,
                        color: Colors.red,
                      ),
                    ],
                  );
                }),
              ),
            )),
            SizedBox(
              height: 20,
            ),
            SizedBox(
                height: 28,
                child: ListView.separated(
                    itemCount: periods.length,
                    scrollDirection: Axis.horizontal,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                              fetchData(periods[index]['period']);
                            });
                          },
                          child: Container(
                            // height: 30,
                            width: 34,

                            decoration: BoxDecoration(
                              color: selectedIndex == index
                                  ? Colors.black
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(3, 3, 3, 3),
                                child: Text(
                                  periods[index]['period'],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: selectedIndex == index
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                )),
                          ));
                    },
                    separatorBuilder: (separatorBuilder, index) {
                      return SizedBox(
                        width: 22,
                      );
                    })),
            SizedBox(
              height: 50,
            )
          ],
        )));
  }

  double getMaxValue() {
    double maxValue = 0;
    for (var item in barChatData) {
      // Parse income and expense strings, replacing commas with periods

      print(item["income"]);
      print(item["expense"]);
      double incomeParsedDouble =
          double.parse(item["income"].replaceAll(',', ''));
      print('incomeParsedDouble: $incomeParsedDouble');

      double expenseParsedDouble =
          double.parse(item["expense"].replaceAll(',', ''));
      print('expenseParsedDouble: $expenseParsedDouble');

      // Compare parsed values and update maxValue accordingly
      if (incomeParsedDouble > maxValue) {
        maxValue = incomeParsedDouble;
      }
      if (expenseParsedDouble > maxValue) {
        maxValue = expenseParsedDouble;
      }
    }
    return maxValue;
  }

  double getMinValue() {
    double maxValue = 0;
    for (var item in barChatData) {
      // Parse income and expense strings, replacing commas with periods
      double incomeParsedDouble =
          double.parse(item["income"].replaceAll(',', ''));
      double expenseParsedDouble =
          double.parse(item["expense"].replaceAll(',', ''));

      // Compare parsed values and update maxValue accordingly
      if (incomeParsedDouble < maxValue) {
        maxValue = incomeParsedDouble;
      }
      if (expenseParsedDouble < maxValue) {
        maxValue = expenseParsedDouble;
      }
    }
    return maxValue;
  }

  fetchData(apiEndPoint) async {
    final response = await http.get(Uri.parse(
        'https://cloudkitchen.macincode.in/api/v1/bar_chart?period=$apiEndPoint'));

    print(
        'https://cloudkitchen.macincode.in/api/v1/bar_chart?period=$apiEndPoint');

    if (response.statusCode == 200) {
      // Request was successful, parse the response data
      final responseData = json.decode(response.body);
      // final List<dynamic> data = responseData['data'];
      // print("Data");
      // print(data);
      // print("Data");
      List<Map<String, dynamic>> chatData =
          (responseData['data'] as List).cast<Map<String, dynamic>>();

      setState(() {
        barChatData = chatData;
      });

      // barChatData = responseData['data'];

      // List<PieChartSectionData> sections = data.map((json) => PieChartSectionData.fromJson(json)).toList();

      // Now you have the list of PieChartSectionData objects
      print('Bar Chart Data:');

      print(barChatData);
    } else {
      // Request failed
      print('Request failed with status: ${response.statusCode}');
    }
  }
}
