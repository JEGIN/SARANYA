import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../global/assets_urls.dart';

class WalkthroughTwoScreen extends StatefulWidget {
  const WalkthroughTwoScreen({super.key});

  @override
  State<WalkthroughTwoScreen> createState() => _WalkthroughTwoScreenState();
}

class _WalkthroughTwoScreenState extends State<WalkthroughTwoScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body:Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AssetsPath.walkthroughTwo),fit: BoxFit.fill)),
      )
    );
  }
}