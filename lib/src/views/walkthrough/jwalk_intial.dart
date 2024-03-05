import 'package:application1/global/app_urls.dart';
import 'package:application1/global/assets_urls.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class JwalkIntialScreenWidget extends StatefulWidget {
  const JwalkIntialScreenWidget({super.key});

  @override
  State<JwalkIntialScreenWidget> createState() => _JwalkIntialScreenWidgetState();
}

class _JwalkIntialScreenWidgetState extends State<JwalkIntialScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body:Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AssetsPath.jwalkintial),fit: BoxFit.fill),
        ),
      ),
    );
  }
}