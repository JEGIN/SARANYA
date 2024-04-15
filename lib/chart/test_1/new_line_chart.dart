import 'package:application1/global/app_urls.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class NewLineChart extends StatefulWidget {
  const NewLineChart({super.key});

  @override
  State<NewLineChart> createState() => _NewLineChartState();
}

class _NewLineChartState extends State<NewLineChart> {
  List<FlSpot> flSpots = [
   FlSpot(0, 3),
    FlSpot(2, 2),
    FlSpot(4.9, 5),
    FlSpot(6.8, 3.1),
    FlSpot(8, 4),
    FlSpot(9.5, 3),
    FlSpot(11, 4),
    
  ];
   List<FlSpot> flSpotsNew = [
   FlSpot(2, 3),
    FlSpot(4.6, 2),
    FlSpot(6.9, 5),
    FlSpot(8.8, 3.1),
    FlSpot(10, 4),
    FlSpot(11.5, 3),
    FlSpot(13, 4),
    
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  child: LineChart(

                      // swapAnimationCurve: Curves.linearToEaseOut,
                      LineChartData(
                        // backgroundColor: Colors.blue,
                          lineTouchData: LineTouchData(enabled: true, 
                          // touchTooltipData: LineTouchTooltipData(
                          //   tooltipBgColor: Colors.blueGrey,
                          //   tooltipRoundedRadius: 20,
                          //   tooltipPadding: EdgeInsets.all(15.0),
                          //   tooltipMargin: 10,
                          
                          // )
                          ),
                          // clipData: FlClipData.all(),
                          // rangeAnnotations: RangeAnnotations(
                          //   verticalRangeAnnotations: [
                          //     VerticalRangeAnnotation(
                          //       x1: 0,
                          //       x2: 4.5,
                          //       color: Colors.red
                          //     ),
                          //      VerticalRangeAnnotation(
                          //       x1: 5,
                          //       x2: 7.5,
                          //       color: Colors.black
                          //     )
                          //   ],
                            
                          // ),
                          gridData: FlGridData(show: false),
                          titlesData: FlTitlesData(show: true),
                          borderData: FlBorderData(show: true,
                          // border: Border.all(color: Colors.red, width: 2)
                          ),
                          extraLinesData: ExtraLinesData(extraLinesOnTop: true,
                          //  horizontalLines: [
                          //    HorizontalLine(y: 0, color: Colors.red),
                          //    HorizontalLine(y: 4.5, color: Colors.green),
                          //  ]
                          ),
                          lineBarsData: [
                        LineChartBarData(
                          show: true,
                          color:  Colors.green,
                          barWidth: 2,
                          curveSmoothness: 0.5,
                          preventCurveOverShooting: true,
                          isStrokeCapRound: false,
                          isStrokeJoinRound: false,
                          belowBarData: BarAreaData(show: false,
                            ),
                            // dotData: FlDotData(show: true,
                            //  checkToShowDot:(spot, barData) => true,
                            //  getDotPainter:(p0, p1, p2, p3) => FlDotCirclePainter(
                            //    radius: 5,
                            //    color: Colors.green,
                            //    strokeWidth: 2,
                            //    strokeColor: Colors.black
                            //  ),
                            
                            // ),
                          // gradient: LinearGradient(
                          //   colors: [Colors.green, Colors.blue],
                          // ),
                          // showingIndicators: [ 2,0,1],
                          shadow: Shadow(
                            color: Colors.green.shade600,
                            blurRadius: 2,
                          ),
                         
                          spots: flSpots,
                          isCurved: true,
                        ),
                       
                      ]
                      
                      )),
                ))));
  }
}
