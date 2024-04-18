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

import 'package:application1/chart/bar_chart.dart';
import 'package:application1/chart/line_chart.dart';
import 'package:application1/chart/multiline_chart.dart';
import 'package:application1/chart/pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: const _MyHomePage(title: 'Line Chart Demo'),
    );
  }
}

class _MyHomePage extends StatelessWidget {
  const _MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Pie Chart',
              ),
              Tab(
                text: 'Bar Chart',
              ),
              Tab(
                text: 'Single-Line Chart',
              ),
              Tab(
                text: 'Multi-Line Chart',
              ),
              
            ],
          ),
        ),
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Center(
              child: PieChartDemo(),
            ),
            Center(
              child: BarChartDemo(),
            ),
            Center(
              child: LineChartDemo(),
            ),
            Center(
              child: MultiLineChartDemo(),
            ),
          ],
        ),
      ),
    );
  }
}
