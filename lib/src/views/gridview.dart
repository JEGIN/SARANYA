import 'package:application1/global/app_urls.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../global/assets_urls.dart';

class GridViewWidget extends StatefulWidget {
  GridViewWidget({super.key});

  @override
  State<GridViewWidget> createState() => _GridViewWidgetState();
}

List dynamicImage = [
  {"image": AssetsPath.Splashnet1},
  {"image": AssetsPath.splashLogo4},
  {"image": AssetsPath.Splashnet2},
  {"image": AssetsPath.Splashnet4},
  {"image": AssetsPath.splashLogo6},
  {"image": AssetsPath.splashLogo3},
  {"image": AssetsPath.splashLogo1},
];

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
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.5,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 3),
                  itemCount: dynamicImage.length,
                  itemBuilder: (context, index) {
                    return dynamicImageWidget(dynamicImage[index]);
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget dynamicImageWidget(data) {
    print(data["image"]);
    String dataImage = data["image"];
    print(dataImage[0]);

    if (dataImage[0] == "h") {
      
    }
    return Image.network(AssetsPath.splashnet);
  }
}
