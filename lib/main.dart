







import 'package:application1/src/views/gradient_text.dart';

import 'global/app_urls.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardScreenWidget(), //GradientTextWidget(), //DashboardScreenWidget(),

      theme: ThemeData(primarySwatch: Colors.deepPurple),
    );
  }
}
