import 'dart:html';

import 'package:application1/global/assets_urls.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SplashScreenWidget extends StatelessWidget {
  const SplashScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        height:MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child:         SingleChildScrollView(child:
        Column (
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment:MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
      GestureDetector(
        onTap: () {
          
        },
        child:
      Image.network( AssetsPath.splashnet

        ),
        
           )   ] )
        )
      ),
    );
  }
}