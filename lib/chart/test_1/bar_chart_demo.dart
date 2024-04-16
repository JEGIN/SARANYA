import 'dart:ffi';

import 'package:d_chart/commons/enums.dart';
import 'package:d_chart/commons/style.dart';
import 'package:flutter/material.dart';
import 'package:d_chart/d_chart.dart';

class BarChart extends StatefulWidget {
  @override
  _BarChartState createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {
  final List<OrdinalGroup> ranking = [
    OrdinalGroup(
      id: '1',
       color: Colors.greenAccent.shade400,
      seriesCategory:  'Income',
      data: [
         OrdinalData(domain: 'Sun', measure: 30),
        OrdinalData(domain: 'Mon', measure: 10),
        OrdinalData(domain: 'Tue', measure: 20),
        OrdinalData(domain: 'Wed', measure: 30),
        OrdinalData(domain: 'Thu', measure: 100),
        OrdinalData(domain: 'Fri', measure: 20),
        OrdinalData(domain: 'Sat', measure: 60),
       
        // OrdinalData(domain: 'Thu', measure: 7),
      ],
    ),

    OrdinalGroup(
      id: '2',
      color: Colors.red,
      seriesCategory:  'Expenses',
      data: [
        OrdinalData(domain: 'Sun', measure: 20),
        OrdinalData(domain: 'Mon', measure: 40),
        OrdinalData(domain: 'Tue', measure: 80),
        OrdinalData(domain: 'Wed', measure: 10),
        OrdinalData(domain: 'Thu', measure: 40),
        OrdinalData(domain: 'Fri', measure: 100),
        OrdinalData(domain: 'Sat', measure: 80),
        
        // OrdinalData(domain: 'Thu', measure: 7),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body: Center(
          child:
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
          
           Container(
            width: MediaQuery.of(context).size.width,
            height: 500,
            child: DChartBarO(
              
              // fillPattern:(group, ordinalData, index) => FillPattern.forwarHatch,
              // areaColor:(group, ordinalData, index) => Colors.deepPurpleAccent,
              // fillColor:(group, ordinalData, index) => Colors.green,
              // dashPattern: (group, ordinalData, index) => [20, 20],
              // vertical: false,
              // allowSliding:true,
              // barLabelDecorator: BarLabelDecorator(
              //  barLabelPosition:BarLabelPosition.auto 
              // ),
              domainAxis:const DomainAxis(
              showLine:false,
              gapAxisToLabel: 10,
              labelStyle:LabelStyle(
               color:Colors.black87,
               fontSize:12,
              ),
              lineStyle: LineStyle(
                color:Colors.grey,
                // dashPattern:[1,1],

              )
              
              ),
              // measureAxis: const MeasureAxis(
              // showLine:false,
              // lineStyle: LineStyle(
              //   color:Colors.grey,
              // ),
              // labelStyle:LabelStyle(
              //  color:Colors.black87,
              //  fontSize:12,
              // ),
              // ),
              groupList: ranking,
             animate: true,
             configRenderBar: ConfigRenderBar( 
              fillPattern:FillPattern.solid,
              radius: 4,
              barGroupingType: BarGroupingType.grouped,
              )
              
            ),
          )),
        ));
  }
}
