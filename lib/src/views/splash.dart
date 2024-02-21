import 'package:application1/global/app_urls.dart';


import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../global/assets_urls.dart';

class SplashScreenWidget extends StatefulWidget {
  const SplashScreenWidget({super.key});

  @override
  State<SplashScreenWidget> createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {

@override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WalkthroughMainScreenWidget()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body:Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Center(
          child: Image.asset(AssetsPath.splashLogo1),
        ),

      )
    );
  }
}