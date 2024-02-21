



import '../../../global/app_urls.dart';

class WalkthroughMainScreenWidget extends StatefulWidget {
  const WalkthroughMainScreenWidget({super.key});

  @override
  State<WalkthroughMainScreenWidget> createState() => _WalkthroughMainScreenWidgetState();
}

class _WalkthroughMainScreenWidgetState extends State<WalkthroughMainScreenWidget> {
 final controller = PageController();

  @override
  Widget build(BuildContext context) {

  //  final pages = List.generate(
  //       6,
  //       (index) => Container(
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(16),
  //               color: Colors.grey.shade300,
  //             ),
  //             margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
  //             child: Container(
  //               height: 280,
  //               child: Center(
  //                   child: Text(
  //                 "Page $index",
  //                 style: TextStyle(color: Colors.indigo),
  //               )),
  //             ),
  //           ));

    return  Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(children: [

          Expanded(
            child: PageView(
              controller: controller,
              children: [
                WalkthroughInitialScreenWidget(),
              ],
            )
          ),
          SizedBox(height: 30,),
//  SmoothPageIndicator(
//                 controller: controller,
//                 count: pages.length,
//                 effect: const WormEffect(
//                   dotHeight: 16,
//                   dotWidth: 16,
//                   type: WormType.thinUnderground,
//                 ),
//               ),
        ],),
      ));
     
  }
}