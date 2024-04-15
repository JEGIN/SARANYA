import 'package:application1/chart/test_1/bar_chart_demo.dart';
import 'package:application1/chart/test_1/line_chart_demo.dart';
import 'package:application1/chart/test_1/multiline_chart_demo.dart';
import 'package:application1/chart/test_1/new_line_chart.dart';
import 'package:application1/chart/test_1/pie_chart_demo.dart';

import '../../global/app_urls.dart';

class MyTabs extends StatelessWidget {
  const MyTabs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Dynamic Charts'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Single-Line Chart',
              ),
              Tab(
                text: 'Multi-Line Chart',
              ),
              Tab(
                text: 'Bar Chart',
              ),
              Tab(
                text: 'Pie Chart',
              ),
            ],
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Center(
              child: LineChartDemo(),
            ),
            Center(
              child: MultiLineChartDemo(),
            ),
            Center(child: BarChart()),
            Center(child: PieChartWidget()),
          ],
        ),
      ),
    );
  }
}
