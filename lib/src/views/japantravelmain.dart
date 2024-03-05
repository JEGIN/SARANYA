import 'package:application1/src/views/walkthrough/jwalk_intial.dart';
import 'package:application1/src/views/walkthrough/jwalk_one.dart';
import 'package:application1/src/views/walkthrough/jwalk_three.dart';
import 'package:application1/src/views/walkthrough/jwalk_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';

class JapanTravelScreenWidget extends StatefulWidget {
  const JapanTravelScreenWidget({super.key});

  @override
  State<JapanTravelScreenWidget> createState() =>
      _JapanTravelScreenWidgetState();
}

class _JapanTravelScreenWidgetState extends State<JapanTravelScreenWidget>
    with SingleTickerProviderStateMixin {
  final controller = PageController();
  bool isLast = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.transparent,
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                isLast = index == 2;
              });
            },
            children: [
              JwalkIntialScreenWidget(),
              JapanWalkThroughScreenWidgetOne(),
              JapanWalkThroughScreenwidgetTwo(),
              JapanWalkThroughThreeWidget(),
            ],
          )),
    );
  }
}
