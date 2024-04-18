import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';
import 'dart:math';
// import library mac_line_chart from stack_chart Package
import 'package:stack_chart/stack_chart.dart';

// ignore: must_be_immutable
class MultiLineChart extends StatefulWidget {
  MultiLineChart({
    super.key,
    this.width,
    this.height,
    this.color,
    required this.labels,
  });

  final double? width;
  final double? height;
  final Color? color;
  final List<String>? labels;

  @override
  State<MultiLineChart> createState() => _MultiLineChartState();
}

class _MultiLineChartState extends State<MultiLineChart> {
  late List<List<MacLineChartSpot>> spotsList;
  final _colors = [
    Colors.blueAccent,
    Colors.redAccent,
    Colors.greenAccent,
  ];

  final _dataNum = 14;

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

  List<List<MacLineChartSpot>> createSpotsList(
      {required int spotsNum, int? length}) {
    final spotsList = <List<MacLineChartSpot>>[];
    final random = Random();
    length = length ?? random.nextInt(20) + 10;
    for (var i = 0; i < spotsNum; i++) {
      var spots = <MacLineChartSpot>[];
      var current = 0.0;
      for (var j = 0; j < length; j++) {
        if (j == 0) {
          current = random.nextDouble() * 10;
        } else {
          current = current + random.nextDouble() * 2 - 1;
        }
        spots.add(MacLineChartSpot(j.toDouble(), current.toDouble()));
      }
      spotsList.add(spots);
    }

    return spotsList;
  }

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    DateFormat outputFormat = DateFormat('yy-MM-dd');
    return Container(
        height: widget.height,
        width: widget.width,
        color: widget.color,
        child: Column(
          children: [
            Expanded(
              child: LineChart(
                data: LineChartData(
                  lineBarsData: spotsList
                      .mapIndexed(
                        (index, spots) => LineChartDataBar(
                          spots: spots,
                          color: _colors[index],
                          point: LineChartPoint(
                              fillColor: Colors.blue,
                              type: LineChartPointType.circle,
                              strokeWidth: 2),
                        ),
                      )
                      .toList(),
                  xAxis: MacLineChartXAxis(
                    label: LineChartXLabel(
                      texts: spotsList.first
                          .map((spot) => LineChartLabelText(
                              spot.x,
                              outputFormat.format(DateTime(
                                  today.year,
                                  today.month,
                                  today.day - _dataNum + spot.x.toInt() + 1))))
                          .toList(),
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 16,
                      ),
                      rotation: -50,
                      alignment: LineChartXLabelAlignment.spaceAround,
                      count: 5,
                      hideOverflowedLabels: true,
                    ),
                  ),
                  yAxis: MacLineChartYAxis(
                    label: LineChartYLabel(
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 16,
                      ),
                    ),
                    grid: LineChartGrid(
                      color: Colors.grey.shade300,
                    ),
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
                                            borderRadius:
                                                BorderRadius.circular(2),
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        RichText(
                                          textAlign: TextAlign.left,
                                          text: TextSpan(
                                            text: widget.labels![index],
                                            children: [
                                              TextSpan(
                                                text:
                                                    spot!.y.toStringAsFixed(2),
                                              )
                                            ],
                                          ),
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
            Container(
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(10)),
              child: TextButton(
                onPressed: () => setSpotsList(),
                child: const Text(
                  'Refresh',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ));
  }
}
