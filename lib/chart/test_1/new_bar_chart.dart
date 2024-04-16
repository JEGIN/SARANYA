import 'package:application1/global/app_urls.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class BarChartNN extends StatefulWidget {
  const BarChartNN({super.key});

  @override
  State<BarChartNN> createState() => _BarChartNNState();
}

class _BarChartNNState extends State<BarChartNN> {
  final List<Map<String, dynamic>> data = [
    {"year": "2020", "income": 50000.4, "expenses": 35000},
    {"year": "2021", "income": 60000.2, "expenses": 40000},
    {"year": "2022", "income": 80000.1, "expenses": 45000},
    {"year": "2023", "income": 70000.3, "expenses": 10000},
    {"year": "2024", "income": 90000.3, "expenses": 20000},
    //  {"year": "2025", "income": 100000.3, "expenses": 50000},
    //    {"year": "2026", "income": 40000.3, "expenses": 20000},
    //    {"year": "2027", "income": 50000.3, "expenses": 30000},
    //    {"year": "2028", "income": 60000.3, "expenses": 40000},
    //    {"year": "2029", "income": 70000.3, "expenses": 50000},

    // {"year": "2024", "income": 10000, "expenses": 75000},
    // {"year": "2025", "income": 20000, "expenses": 55000}
  ];

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
      "period": "3M",
    },
    {
      "period": "1Y",
    },
    {
      "period": "YTD",
    },
  ];
  int selectedIndex = 0;
  @override
  void initState() {
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
                  Text("Expenses")
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
                            return Text('${data[value.toInt()]["year"]}');
                          }

                          // (value) {
                          //   return data[value.toInt()]["year"];
                          // },
                          ),
                    )),
                borderData: FlBorderData(
                  show: false,
                ),
                barGroups: List.generate(data.length, (index) {
                  return BarChartGroupData(
                    groupVertically: false,
                    barsSpace: 2,
                    x: index,
                    barRods: [
                      BarChartRodData(
                        width: data.length <= 5 ? 26 : 10,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4),
                        ),
                        toY: data[index]["income"].toDouble(),
                        color: Colors.green,
                      ),
                      BarChartRodData(
                        width: data.length <= 5 ? 26 : 10,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4),
                        ),
                        toY: data[index]["expenses"].toDouble(),
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
                      return
                      GestureDetector(
                        onTap: () {
                          setState(() {
                             selectedIndex = index;
                          });
                        },
                      
                     child:  Container(
                        // height: 30,
                        width: 34,
                        
                        decoration: BoxDecoration(
                          color:selectedIndex == index ?Colors.black: Colors.transparent,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(3, 3, 3, 3),
                            child: Text(periods[index]['period'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                          color:    selectedIndex == index ? Colors.white : Colors.black,
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
    for (var item in data) {
      if (item["income"] > maxValue) {
        maxValue = item["income"].toDouble();
      }
      if (item["expenses"] > maxValue) {
        maxValue = item["expenses"].toDouble();
      }
    }
    return maxValue;
  }

  double getMinValue() {
    double maxValue = 0;
    for (var item in data) {
      if (item["income"] < maxValue) {
        maxValue = item["income"].toDouble();
      }
      if (item["expenses"] < maxValue) {
        maxValue = item["expenses"].toDouble();
      }
    }
    return maxValue;
  }
}
