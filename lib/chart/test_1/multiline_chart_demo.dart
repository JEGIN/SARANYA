import 'dart:math';

import 'package:collection/collection.dart';
import 'package:echart_flutter/echart_flutter.dart';
// import 'package:application1/global/util.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final _colors = [
    Colors.greenAccent,
      Colors.redAccent,
  Colors.blueAccent,


];

const _labels = [
 'Credit',
    'Debit',
    'Due',
];

const _dataNum = 14;

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

class MultiLineChartDemo extends StatefulWidget {
  const MultiLineChartDemo({Key? key}) : super(key: key);

  @override
  State<MultiLineChartDemo> createState() => _MultiLineChartDemoState();
}

class _MultiLineChartDemoState extends State<MultiLineChartDemo> {
  late List<List<LineChartSpot>> spotsList;

  @override
  void initState() {
    setSpotsList();
    super.initState();
  }

  void setSpotsList() {
    setState(() {
      spotsList = createSpotsList(spotsNum: 3, length: _dataNum);
    });
  }
List<List<LineChartSpot>> createSpotsList(
      {required int spotsNum, int? length}) {
    final spotsList = <List<LineChartSpot>>[];
    final random = Random();
    length = length ?? random.nextInt(20) + 10;
    for (var i = 0; i < spotsNum; i++) {
      var spots = <LineChartSpot>[];
      var current = 0.0;
      for (var j = 0; j < length; j++) {
        if (j == 0) {
          current = random.nextDouble() * 10;
        } else {
          current = current + random.nextDouble() * 2 - 1;
        }
        spots.add(LineChartSpot(j.toDouble(), current.toDouble()));
      }
      spotsList.add(spots);
    }

    return spotsList;
  }
  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    DateFormat outputFormat = DateFormat('yy-MM-dd');
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: LineChart(
            data: LineChartData(
              lineBarsData: spotsList
                  .mapIndexed(
                    (index, spots) => LineChartBarData(
                      spots: spots,
                      color: _colors[index],
                      strokeCap: StrokeCap.square,
                       point:  LineChartPoint(fillColor: Colors.blue,type:  LineChartPointType.circle,
                          strokeWidth:2
                          ),
                    ),
                  )
                  .toList(),
              xAxis: LineChartXAxis(
                // label: LineChartXLabel(
                //   texts: spotsList.first
                //       .map((spot) => LineChartLabelText(
                //           spot.x,
                //           outputFormat.format(DateTime(today.year, today.month,
                //               today.day - _dataNum + spot.x.toInt() + 1))))
                //       .toList(),
                //   style: TextStyle(
                //     color: Colors.grey.shade600,
                //     fontSize: 12,
                //   ),
                //   rotation: -50,
                //   alignment: LineChartXLabelAlignment.values[0],
                //   count: 5,
                //   hideOverflowedLabels: true,
                // ),
              ),
              yAxis: LineChartYAxis(
                label: LineChartYLabel(
                  style: TextStyle(
                    color: Colors.transparent,
                    fontSize: 16,
                  ),
                ),
                grid: LineChartGrid(
                    color: Colors.grey.shade200, strokeWidth: 2.0),
                range: LineChartRange(min: 0, max: 20),
              ),
              area: LineChartArea(
                  border: Border.all(
                    color: Colors.grey.shade300,
                  ),
                  padding: const EdgeInsets.all(16),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  color: Colors.white),
            ),
            tooltip: LineChartTooltip(
              builder: (spots) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    color: Colors.white,
                  ),
                  child: IntrinsicWidth(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(4),
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(7),
                              topRight: Radius.circular(7),
                            ),
                            color: Colors.white,
                          ),
                          child: Text(
                            outputFormat.format(DateTime(
                                today.year,
                                today.month,
                                today.day -
                                    _dataNum +
                                    spots.first!.x.toInt() +
                                    1)),
                          ),
                        ),
                        const Divider(
                          color: Colors.grey,
                          thickness: 1,
                          height: 1,
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 8),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(7),
                              bottomRight: Radius.circular(7),
                            ),
                          ),
                          child: Column(
                            children: spots.mapIndexed(
                              (index, spot) {
                                return Row(
                                  children: [
                                    Container(
                                      width: 12,
                                      height: 12,
                                      decoration: BoxDecoration(
                                        color: _colors[index],
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      '${_labels[index]}: ${spot!.y.toStringAsFixed(2)}',
                                    ),
                                  ],
                                );
                              },
                            ).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
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
                              setSpotsList();
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
    );
  }
}
