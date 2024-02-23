import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../global/assets_urls.dart';
import '../login_screen.dart';

class WalkthroughThreeScreen extends StatefulWidget {
  const WalkthroughThreeScreen({super.key});

  @override
  State<WalkthroughThreeScreen> createState() => _WalkthroughThreeScreenState();
}

class _WalkthroughThreeScreenState extends State<WalkthroughThreeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body:Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AssetsPath.walkthroughThree),fit: BoxFit.fill)),
        
      )
    );
  }
}