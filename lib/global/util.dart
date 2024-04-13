import 'dart:math';

// import 'package:flutter/cupertino.dart';
// import 'dart:math' as math;
import 'package:echart_flutter/echart_flutter.dart';

List<List<LineChartSpot>> createSpotsList(
    {required int spotsNum, int? length}) {
  final spotsList = <List<LineChartSpot>>[];
  final random = Random();
  length = length ?? random.nextInt(25) + 10;
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

// class Pie {
//   final Color color;
//   final double proportion;
//   Pie({required this.color, required this.proportion});

//   Color get getColor => color;
//   double get getPercentage => proportion;
// }

// class FlutterPieChartPainter extends CustomPainter {
//   final List<Pie> pies;
//   final int selected;
//   final double animFraction;
//   double _totalAngle = math.pi * 2;
//   FlutterPieChartPainter({
//     required this.pies,
//     required this.selected,
//     required this.animFraction,
//   }) {
//     _totalAngle = animFraction * math.pi * 2;
//     assert(selected < pies.length,
//         "The selected pie must be in the pies list range!!");
//   }

//   @override
//   void paint(Canvas canvas, Size size) {
//     final side = size.width < size.height ? size.width : size.height;
//     final Paint paint = Paint();
//     double totalProp = 0.0;
//     for (final pie in pies) {
//       totalProp = totalProp + pie.proportion;
//     }
//     for (int i = 0; i < pies.length; i++) {
//       final percentage = pies[i].proportion / totalProp;

//       final startValue = i == 0
//           ? 0
//           : i == 1
//               ? (pies[i - 1].proportion / totalProp)
//               : (pies[i - 1].proportion / totalProp) +
//                   (pies[i - 2].proportion / totalProp);

//       final startAngle = startValue * 2 * math.pi;
//       print("*******");
//       print(percentage);

//       print(startAngle);
//       print("*******");
//       paint
//         ..color = pies[i].color
//         ..style = PaintingStyle.fill;
//       canvas.drawArc(Rect.fromLTWH(0.0, 0.0, side, size.height), startAngle,
//           percentage * _totalAngle, true, paint);
//       if (selected == i) {
//         paint
//           ..style = PaintingStyle.stroke
//           ..strokeWidth = size.width * 0.012
//           ..strokeCap = StrokeCap.round;
//         canvas.drawArc(
//             Rect.fromCircle(
//                 center: Offset(size.width / 2, size.height / 2),
//                 radius: size.width / 2 + size.width / 30),
//             startAngle,
//             percentage * _totalAngle,
//             false,
//             paint);
//       }
//     }
//   }

//   @override
//   bool shouldRepaint(covariant FlutterPieChartPainter oldDelegate) =>
//       oldDelegate.animFraction != animFraction ||
//       oldDelegate.pies != pies ||
//       oldDelegate.selected != selected;
// }
