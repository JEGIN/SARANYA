// import 'package:application1/global/util.dart';
// import 'package:flutter/material.dart';

// class PieChart extends StatefulWidget {
//   const PieChart({super.key});

//   @override
//   State<PieChart> createState() => _PieChartState();
// }

// class _PieChartState extends State<PieChart> {
//   final List<Pie> pies = [
//     Pie(color: const Color(0xFFFF6262), proportion: 20),
//     Pie(color: const Color(0xFFFF9494), proportion: 30),
//     Pie(color: const Color(0xFFFF6262), proportion: 30),
//     Pie(color: const Color(0xFFFF9494), proportion: 20)
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: FlutterPieChart(
//         pies: pies,
//         selected: 3,
//       ),
//       height: 300,
//       width: 300,
//     );
//   }
// }

// // class FlutterPieChart extends StatefulWidget {
// //   FlutterPieChart({
// //     Key? key,
// //     required this.pies,
// //     required this.selected,
// //     this.animationDuration = const Duration(milliseconds: 1000),
// //   }) : super(key: key) {
// //     assert(selected < pies.length,
// //         "The selected pie must be in the pies list range!!");
// //   }
// //   final List<Pie> pies;
// //   final int selected;
// //   final Duration animationDuration;
// //   @override
// //   State<FlutterPieChart> createState() => _FlutterPieChartState();
// // }

// // class _FlutterPieChartState extends State<FlutterPieChart>
// //     with SingleTickerProviderStateMixin {
// //   late Animation<double> animation;
// //   AnimationController? controller;
// //   double _animFraction = 0.0;
// //   @override
// //   void initState() {
// //     super.initState();
// //     controller = AnimationController(
// //       duration: widget.animationDuration,
// //       vsync: this,
// //     );
// //     final Animation curve = CurvedAnimation(
// //       parent: controller!,
// //       curve: Curves.easeInOutBack,
// //     );
// //     animation =
// //         Tween<double>(begin: 0, end: 1).animate(curve as Animation<double>)
// //           ..addListener(() {
// //             setState(() {
// //               _animFraction = animation.value;
// //             });
// //           });
// //     controller!.forward();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return AspectRatio(
// //       aspectRatio: 1,
// //       child: CustomPaint(
// //         painter: FlutterPieChartPainter(
// //           pies: widget.pies,
// //           selected: widget.selected,
// //           animFraction: _animFraction,
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:application1/global/util.dart';
// import 'package:animated_pie_chart/animated_pie_chart.dart';
// import 'package:flutter/material.dart';

// class PieChart extends StatefulWidget {
//   const PieChart({super.key});

//   @override
//   State<PieChart> createState() => _PieChartState();
// }

// class _PieChartState extends State<PieChart> {
//   List<MdPieChart> pieChartList = [
//     MdPieChart(value: 10, name: 'Credit'),
//     MdPieChart(value: 20, name: 'Debit'),
//     MdPieChart(value: 12, name: 'Cash'),
//     MdPieChart(value: 14, name: 'Other'),
//     MdPieChart(value: 16, name: 'Transfer'),
//     MdPieChart(value: 28, name: 'UPI'),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 300,
//       width: 300,
//       child: AnimatedPieChart(
//         sort: true,
//         stokeWidth: 8.0,
//         padding: 3.0,
//         animatedSpeed: 500,
//         pieRadius: 70.0,
//         colorsList: [
//           Colors.brown,
//           Colors.purple,
//           Colors.red,
//           Colors.yellow,
//           Colors.green,
//           Colors.blue,
//         ],
//         textSize: 14.0,
//         pieData: [
//           for (int i = 0; i < pieChartList.length; i++)
//             MdPieChart(value: pieChartList[i].value, name: pieChartList[i].name)
//         ],
//       ),
//     );
//   }
// }
