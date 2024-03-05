





import 'package:application1/src/views/gridview.dart';
import 'package:application1/src/views/japantravelmain.dart';
import 'package:application1/src/views/login_screen.dart';

import 'package:application1/src/views/userprofile.dart';

import 'global/app_urls.dart';
import 'src/views/walkthrough/dashboard.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigationBarExample(),

      theme: ThemeData(primarySwatch: Colors.deepPurple),
    );
  }
}
