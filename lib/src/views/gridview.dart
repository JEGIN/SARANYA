import 'package:application1/global/app_urls.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../global/assets_urls.dart';

class GridViewWidget extends StatefulWidget {
  const GridViewWidget({super.key});

  @override
  State<GridViewWidget> createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
              color: Colors.black12,
              child:
               GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                     childAspectRatio: 1.5,
                     crossAxisSpacing: 10,
                     mainAxisSpacing: 10,
                      crossAxisCount: 3),
                      itemCount: 30,
                  itemBuilder: (context, index) {
                  return  Image.network(AssetsPath.splashnet);
                  
                  }),
            )
          ],
        ),
      ),
    );
  }
}
