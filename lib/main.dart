// import 'package:application1/chart/test_1/sample_1.dart';
// import 'package:application1/src/views/gradient_text.dart';
// import 'global/app_urls.dart';


// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Sample1(), //GradientTextWidget(), //DashboardScreenWidget(),

//       theme: ThemeData(primarySwatch: Colors.deepPurple),
//     );
//   }
// }

import 'package:application1/chart/test_1/bar_chart_demo.dart';
import 'package:application1/chart/test_1/chart_tabs.dart';
import 'package:application1/chart/test_1/line_chart_demo.dart';
import 'package:application1/chart/test_1/multiline_chart_demo.dart';
import 'package:application1/chart/test_1/pie_chart_demo.dart';
import 'package:flutter/material.dart';

import 'chart/test_1/new_bar_chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Line Chart',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF262626),
          centerTitle: true,
          elevation: 1,
          scrolledUnderElevation: 0,
        ),
        indicatorColor: const Color(0xFF0C00C5),
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.black,
        ),
        primaryColor: const Color(0xFF0C00C5),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              const Color(0xFF0C00C5),
            ),
          ),
        ),
        dividerTheme: const DividerThemeData(
          color: Color(0xFFE5E5E5),
          thickness: 1,
          space: 0,
          indent: 0,
          endIndent: 0,
        ),
      ),
      home: const MyTabs(),
    );
  }
}


