import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../global/assets_urls.dart';

class WalkthroughInitialScreenWidget extends StatefulWidget {
  const WalkthroughInitialScreenWidget({super.key});

  @override
  State<WalkthroughInitialScreenWidget> createState() => _WalkthroughInitialScreenWidgetState();
}

class _WalkthroughInitialScreenWidgetState extends State<WalkthroughInitialScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body:Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AssetsPath.Walkthrough),fit: BoxFit.fill)),
      )
    );
  }
}