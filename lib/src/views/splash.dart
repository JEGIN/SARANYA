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
      Image.network( AssetsPath.splashnet

        ),
        SizedBox(
          height: 40,
        ),
            Image.network( AssetsPath.Splashnet1

        ),

       SizedBox(
          height: 40,
        ), 
        Image.network( AssetsPath.Splashnet2

        ),
         
        
              SizedBox(
          height: 40,
        ),
        Image.network( AssetsPath.Splashnet4

        ),
        SizedBox(
          height: 40,
        ),
                Image.network( AssetsPath.Splashnet5

        ),


        
      Image.asset( AssetsPath.splashLogo1

        ),
        
        Image.asset( AssetsPath.splashLogo2

        ),
         Image.asset( AssetsPath.splashLogo3

        ),
         Image.asset( AssetsPath.splashLogo4

        ),
         Image.asset( AssetsPath.splashLogo5

        ),
         Image.asset( AssetsPath.splashLogo6

        ),
        ],
        
        
        )
        )
      ),
    );
  }
}