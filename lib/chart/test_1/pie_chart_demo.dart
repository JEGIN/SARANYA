import 'dart:convert';

import 'package:application1/global/app_urls.dart';
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:fl_chart/fl_chart.dart';
import 'package:http/http.dart' as http;

class PieChartWidget extends StatefulWidget {
  const PieChartWidget({
    super.key,
    this.width,
    this.height,
    this.color,
  });

  final double? width;
  final double? height;
  final Color? color;

  @override
  State<PieChartWidget> createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  TextStyle style = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  int touchedIndex = -1;

  List<PieChartSectionData> sections = [];

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

  // List<PieChartSectionData> sections = [
  //   PieChartSectionData(
  //     color: const Color(0xFF8BC1F7),
  //     value: 32,
  //     title: 'Savings',
  //     radius: 50,
  //     titleStyle: const TextStyle(
  //       fontSize: 16,
  //       fontWeight: FontWeight.bold,
  //       color: Colors.white,
  //     ),
  //   ),
  //   PieChartSectionData(
  //     color: const Color(0xFFBDE2B9),
  //     value: 12,
  //     title: 'Income',
  //     radius: 50,
  //     titleStyle: const TextStyle(
  //       fontSize: 16,
  //       fontWeight: FontWeight.bold,
  //       color: Colors.white,
  //     ),
  //   ),
  //   PieChartSectionData(
  //     color: const Color(0xFF009596),
  //     value: 16,
  //     title: 'Expense',
  //     radius: 50,
  //     titleStyle: const TextStyle(
  //       fontSize: 16,
  //       fontWeight: FontWeight.bold,
  //       color: Colors.white,
  //     ),
  //   ),
  //   PieChartSectionData(
  //     color: const Color(0xFFB8BBBE),
  //     value: 20,
  //     title: 'Investment',
  //     radius: 50,
  //     titleStyle: const TextStyle(
  //       fontSize: 16,
  //       fontWeight: FontWeight.bold,
  //       color: Colors.white,
  //     ),
  //   ),
  //   PieChartSectionData(
  //     color: const Color(0xFF3C3D99),
  //     value: 14,
  //     title: 'Bills',
  //     radius: 50,
  //     titleStyle: const TextStyle(
  //       fontSize: 16,
  //       fontWeight: FontWeight.bold,
  //       color: Colors.white,
  //     ),
  //   ),
  //   PieChartSectionData(
  //     color: const Color(0xFF6A6E73),
  //     value: 4,
  //     title: 'Debits',
  //     radius: 50,
  //     titleStyle: const TextStyle(
  //       fontSize: 16,
  //       fontWeight: FontWeight.bold,
  //       color: Colors.white,
  //     ),
  //   ),
  //   PieChartSectionData(
  //     color: const Color(0xFFF4B678),
  //     value: 2,
  //     title: 'Credits',
  //     radius: 50,
  //     titleStyle: const TextStyle(
  //       fontSize: 16,
  //       fontWeight: FontWeight.bold,
  //       color: Colors.white,
  //     ),
  //   ),
  //   PieChartSectionData(
  //     color: const Color(0xFF23511E),
  //     value: 10,
  //     title: 'Dues',
  //     radius: 50,
  //     titleStyle: const TextStyle(
  //       fontSize: 16,
  //       fontWeight: FontWeight.bold,
  //       color: Colors.white,
  //     ),
  //   ),
  // ];

  @override
  void initState() {
    fetchData(apiEndPoint);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.height,
        width: widget.width,
        color: widget.color,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Expanded(
            child: PieChart(
              PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                    // border: Border.all(color: Colors.black, width: 2),
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 0,
                  sections: showingSections()),
            ),
          ),
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
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: sections.length,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: sections[index].color,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                              width: 100,
                              child: Text(
                                sections[index].title.toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              )),
                          SizedBox(
                              width: 70,
                              child:
                                  //  RichText(
                                  //   textAlign:TextAlign.center,
                                  //    text: TextSpan(
                                  //      children: [
                                  //        TextSpan(text: ' ( ',
                                  //         style: const TextStyle(
                                  //         fontSize: 14,
                                  //         fontWeight: FontWeight.bold,
                                  //         color: Colors.black,
                                  //       ),
                                  //        ),
                                  //          TextSpan(text: sections[index].value.toString(),
                                  //           style: const TextStyle(
                                  //         fontSize: 14,
                                  //         fontWeight: FontWeight.bold,
                                  //         color: Colors.black,
                                  //       ),
                                  //          ),
                                  //            TextSpan(text: ' % ) ',
                                  //             style: const TextStyle(
                                  //         fontSize: 14,
                                  //         fontWeight: FontWeight.bold,
                                  //         color: Colors.black,
                                  //       ),
                                  //            ),
                                  //      ],
                                  //  ))
                                  Text(
                                ' ( ${sections[index].value.toString()} % ) ',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ))
                        ],
                      );

                      // Text(sections[index].value.toString());
                    })),
          ),
        ]));
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(sections.length, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 130.0 : 120.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

      return PieChartSectionData(
        showTitle: false,
        color: sections[i].color,
        value: sections[i].value,
        // title: isTouched
        //     ? '${sections[i].value.toString()} %'
        //     : sections[i].title.toString(),
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: shadows,
        ),
        badgeWidget: isTouched
            ? Tooltip(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                ),
                message: '',
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.black,
                    ),
                    child: Padding(
                        padding: EdgeInsets.all(4),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              sections[i].title.toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text(
                              '${sections[i].value.toString()} %',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ))))
            : SizedBox.shrink(),
      );
    });
  }

  fetchData(apiEndPoint) async {
    print(apiEndPoint);
    final response = await http.get(Uri.parse(
        'https://cloudkitchen.macincode.in/api/v1/pie_chart?period=$apiEndPoint'));

    print('https://cloudkitchen.macincode.in/api/v1/pie_chart?period=$apiEndPoint');
    

    if (response.statusCode == 200) {
      // Request was successful, parse the response data
      final responseData = json.decode(response.body);
      final List<dynamic> data = responseData['data'];

      // Convert data to a list of PieChartSectionData
      List<PieChartSectionData> newSections = data.map((item) {
        return PieChartSectionData(
          color: Color(
              int.parse(item['color'].substring(1, 9), radix: 16) + 0xFF000000),
          value: double.parse(item['value'].toString()),
          title: item['title'],
          radius: double.parse(responseData['radius'].toString()),
          titleStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        );
      }).toList();

      // Update state with the new data
      setState(() {
        sections = newSections;
      });
    } else {
      // Request failed
      print('Request failed with status: ${response.statusCode}');
    }
  }
}
