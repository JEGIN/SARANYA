import 'package:application1/global/app_urls.dart';
import 'package:application1/global/assets_urls.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class JapanWalkThroughScreenWidgetOne extends StatefulWidget {
  const JapanWalkThroughScreenWidgetOne({super.key});

  @override
  State<JapanWalkThroughScreenWidgetOne> createState() => _JapanWalkThroughScreenWidgetOneState();
}

class _JapanWalkThroughScreenWidgetOneState extends State<JapanWalkThroughScreenWidgetOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

     body:Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AssetsPath.jwalkone),fit: BoxFit.fill)),
    ));
  }
}