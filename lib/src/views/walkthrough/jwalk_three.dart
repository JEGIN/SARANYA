import 'package:application1/global/app_urls.dart';
import 'package:application1/global/assets_urls.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class JapanWalkThroughThreeWidget extends StatefulWidget {
  const JapanWalkThroughThreeWidget({super.key});

  @override
  State<JapanWalkThroughThreeWidget> createState() => _JapanWalkThroughThreeWidgetState();
}

class _JapanWalkThroughThreeWidgetState extends State<JapanWalkThroughThreeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.transparent,
      body:Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AssetsPath.jwalkthree),fit: BoxFit.fill),
        ),
      ),

    );
  }
}