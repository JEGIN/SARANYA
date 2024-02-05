





import 'package:application1/src/views/gridview.dart';

import 'global/app_urls.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GridViewWidget(),

      theme: ThemeData(primarySwatch: Colors.deepPurple),
    );
  }
}
