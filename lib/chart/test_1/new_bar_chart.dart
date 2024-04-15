import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';






class BarChartNN extends StatefulWidget {
  const BarChartNN({super.key});

  @override
  State<BarChartNN> createState() => _BarChartNNState();
}

class _BarChartNNState extends State<BarChartNN> {
 final List<Map<String, dynamic>> data = [
    {"year": "2020", "income": 50000, "expenses": 35000},
    {"year": "2021", "income": 60000, "expenses": 40000},
    {"year": "2022", "income": 70000, "expenses": 45000}
  ];

  @override
  void initState() {
    super.initState();
    
  }


  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: EdgeInsets.all(16.0),
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: getMaxValue(),
          barTouchData: BarTouchData(enabled: true),
          titlesData: FlTitlesData(
            leftTitles:
            AxisTitles(sideTitles: 
             SideTitles(showTitles: true)),
            bottomTitles:
               AxisTitles(sideTitles: 
             SideTitles(
              showTitles: true,
              getTitlesWidget:  (
                value,
                meta,
              ){
                return Text('${data[value.toInt()]["year"]}');
              }
              
              
              // (value) {
              //   return data[value.toInt()]["year"];
              // },
            ),
           ) ),
          borderData: FlBorderData(
            show: false,
          ),
          barGroups: List.generate(data.length, (index) {
            return BarChartGroupData(
              barsSpace:4,
              x: index,
              barRods: [
                BarChartRodData(
                  width: 26,
                  borderRadius: BorderRadius.circular(6),
                  toY: data[index]["income"].toDouble(),
                  color: Colors.green,
                ),
                BarChartRodData(
                  width: 26,
                   borderRadius: BorderRadius.circular(6),
                  toY: data[index]["expenses"].toDouble(),
                  color: Colors.red,
                ),
              ],
            );
          }),
        ),
      ),
    );
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
}

