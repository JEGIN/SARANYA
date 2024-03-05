import 'package:application1/global/assets_urls.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class JapanWalkThroughScreenwidgetTwo extends StatefulWidget {
  const JapanWalkThroughScreenwidgetTwo({super.key});

  @override
  State<JapanWalkThroughScreenwidgetTwo> createState() =>
      _JapanWalkThroughScreenwidgetTwoState();
}

class _JapanWalkThroughScreenwidgetTwoState
    extends State<JapanWalkThroughScreenwidgetTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AssetsPath.jwalktwo), fit: BoxFit.fill)),
      ),
    );
  }
}
