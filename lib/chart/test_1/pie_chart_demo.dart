import 'package:flutter/material.dart';
import 'package:flutter_pie_chart/flutter_pie_chart.dart';

class PieChart extends StatefulWidget {
  const PieChart({super.key});

  @override
  State<PieChart> createState() => _PieChartState();
}

class _PieChartState extends State<PieChart> {
  final List<Pie> pies = [
    Pie(color: const Color(0xFFFF6262), proportion: 20),
    Pie(color: const Color(0xFFFF9494), proportion: 20),
    Pie(color: const Color(0xFFFFDCDC), proportion: 60),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlutterPieChart(
        pies: pies,
        selected: 2,
      ),
      height: 300,
      width: 300,
    );
  }
}
