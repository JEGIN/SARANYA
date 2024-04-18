// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import library mac_line_chart from stack_chart Package
import 'package:stack_chart/stack_chart.dart';

const _dataNum = 250;

class SingleLineChart extends StatefulWidget {
  String chartLabel;
  Color? lineColor;
  SingleLineChart({Key? key, required this.chartLabel, this.lineColor});
  // Labels Array

  @override
  State<SingleLineChart> createState() => _SingleLineChartState();
}

class _SingleLineChartState extends State<SingleLineChart> {
  late List<List<MacLineChartSpot>> spotsList;

  @override
  void initState() {
    setSpotsList();
    super.initState();
  }

  void setSpotsList() {
    setState(() {
      spotsList = createSpotsList(spotsNum: 1, length: _dataNum);
    });
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
                    (index, spots) => LineChartDataBar(
                      spots: spots,
                      color: widget.lineColor!,
                      strokeCap: StrokeCap.square,
                    ),
                  )
                  .toList(),
              xAxis: MacLineChartXAxis(
                label: LineChartXLabel(
                  texts: spotsList.first
                      .map(
                        (spot) => LineChartLabelText(
                          spot.x,
                          outputFormat.format(
                            DateTime(today.year, today.month,
                                today.day - _dataNum + spot.x.toInt() + 1),
                          ),
                        ),
                      )
                      .toList(),
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                  ),
                  rotation: -50,
                  alignment: LineChartXLabelAlignment.values[0],
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
                            outputFormat.format(
                              DateTime(
                                today.year,
                                today.month,
                                today.day -
                                    _dataNum +
                                    spots.first!.x.toInt() +
                                    1,
                              ),
                              // 24,
                              // 12,
                              // 29),
                            ),
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
                                        color: widget.lineColor,
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(widget.chartLabel),
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
        const SizedBox(height: 32),
        ElevatedButton(
          onPressed: () => setSpotsList(),
          child: const Text(
            'Refresh',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ),
      ],
    );
  }
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
