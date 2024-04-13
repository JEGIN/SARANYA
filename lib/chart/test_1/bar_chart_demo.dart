import 'dart:math';

import 'package:flutter/material.dart';
import 'package:d_chart/d_chart.dart';

class BarChartDemo extends StatefulWidget {
  const BarChartDemo({super.key});

  @override
  State<BarChartDemo> createState() => _BarChartDemoState();
}

final List ranking = [
  {'class': 'A', 'total': 23},
  {'class': 'B', 'total': 14},
  {'class': 'C', 'total': 8},
  {'class': 'D', 'total': 7},
  {'class': 'E', 'total': 21},
  {'class': 'F', 'total': 14},
  {'class': 'G', 'total': 8},
  {'class': 'H', 'total': 7},
  {'class': 'I', 'total': 21},
  {'class': 'J', 'total': 21},
  {'class': 'K', 'total': 14},
  {'class': 'L', 'total': 8},
  {'class': 'M', 'total': 7},
  {'class': 'N', 'total': 21},
  {'class': 'O', 'total': 7},
];

class _BarChartDemoState extends State<BarChartDemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      height: 300,

      child: DChartBarCustom(
        loadingDuration: const Duration(milliseconds: 200),
        showLoading: false,
        valueAlign: Alignment.topCenter,
        showDomainLine: true,
        showDomainLabel: true,
        showMeasureLine: true,
        showMeasureLabel: true,
        spaceDomainLabeltoChart: 10,
        spaceMeasureLabeltoChart: 5,
        spaceDomainLinetoChart: 5,
        spaceMeasureLinetoChart: 5,
        spaceBetweenItem: 16,
        radiusBar: const BorderRadius.only(
          topLeft: Radius.circular(6),
          topRight: Radius.circular(6),
        ),
        measureLabelStyle: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 12,
          color: Colors.blue,
        ),
        domainLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.green,
        ),
        measureLineStyle: const BorderSide(color: Colors.grey, width: 2),
        domainLineStyle: const BorderSide(color: Colors.grey, width: 2),
        max: 25,
        listData: List.generate(ranking.length, (index) {
          // Random from 'dart:math'
          Color currentColor =
              Color((Random().nextDouble() * 0xFFFFFF).toInt());
          return DChartBarDataCustom(
            onTap: () {
              print(
                '${ranking[index]['class']} => ${ranking[index]['total']}',
              );
              setState(() {});
            },
            elevation: 3,
            value: ranking[index]['total'].toDouble(),
            label: ranking[index]['class'],
            color: currentColor.withOpacity(1),
            splashColor: Colors.blue,
            // showValue: ranking[index]['class'] == 'C' ? false : true,
            // valueStyle: ranking[index]['class'] == 'A'
            //     ? const TextStyle(
            //         fontWeight: FontWeight.bold,
            //         fontSize: 16,
            //         color: Colors.black,
            //       )
            //     : const TextStyle(
            //         fontWeight: FontWeight.bold,
            //         fontSize: 16,
            //         color: Colors.white,
            //       ),
            // labelCustom: ranking[index]['class'] == 'B'
            //     ? Transform.rotate(
            //         angle: 5.5,
            //         child: const Text('B'),
            //       )
            //     : null,
            valueCustom: ranking[index]['total'] > 20
                ? Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            border: Border.all(width: 2),
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '${ranking[index]['total']}',
                            style: const TextStyle(
                              fontSize: 11,
                              color: Colors.red,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        const Text(
                          '😄',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  )
                : null,
            valueTooltip: '${ranking[index]['total']} Student'.toUpperCase(),
          );
        }),
      ),

      //   AspectRatio(
      //   aspectRatio: 16 / 9,
      //   child: DChartBarO(
      //     animate: true,
      //     groupList: [
      //       OrdinalGroup(
      //         id: 'id',
      //         data: [
      //           OrdinalData(
      //             domain: '2',
      //             measure: 2,
      //             color: Colors.red,
      //             other: Tooltip(
      //               message: '2',
      //             ),
      //           ),
      //           OrdinalData(
      //             domain: '3',
      //             measure: 3,
      //             color: Colors.green,
      //             other: Tooltip(
      //               message: '3',
      //             ),
      //           ),
      //           OrdinalData(
      //               domain: '4',
      //               measure: 4,
      //               color: Colors.blue,
      //               other: Tooltip(
      //                 message: '4',
      //               )),
      //           OrdinalData(
      //               domain: '5',
      //               measure: 5,
      //               color: Colors.yellow,
      //               other: Tooltip(
      //                 message: '5',
      //               )),
      //           OrdinalData(
      //             domain: '6',
      //             measure: 6,
      //             color: Colors.red,
      //             other: Tooltip(
      //               message: '6',
      //             ),
      //           ),
      //           OrdinalData(
      //             domain: '7',
      //             measure: 7,
      //             color: Colors.green,
      //             other: Tooltip(
      //               message: '7',
      //             ),
      //           ),
      //           OrdinalData(
      //               domain: '8',
      //               measure: 8,
      //               color: Colors.blue,
      //               other: Tooltip(
      //                 message: '8',
      //               )),
      //           OrdinalData(
      //               domain: '9',
      //               measure: 9,
      //               color: Colors.yellow,
      //               other: Tooltip(
      //                 message: '9',
      //               ))
      //         ],
      //       ),
      //     ],
      //     domainAxis: DomainAxis(
      //       ordinalViewport: OrdinalViewport('1', 10),
      //     ),
      //     measureAxis: const MeasureAxis(
      //       numericViewport: NumericViewport(0, 25),
      //     ),
      //     allowSliding: true,
      //   ),
    );
  }
}
