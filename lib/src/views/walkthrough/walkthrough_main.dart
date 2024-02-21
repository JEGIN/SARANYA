







import '../../../global/app_urls.dart';

class WalkthroughMainScreenWidget extends StatefulWidget {
  const WalkthroughMainScreenWidget({super.key});

  @override
  State<WalkthroughMainScreenWidget> createState() => _WalkthroughMainScreenWidgetState();
}

class _WalkthroughMainScreenWidgetState extends State<WalkthroughMainScreenWidget> {
 final controller = PageController();
 bool isLast = false;

  @override
  Widget build(BuildContext context) {


    return  Scaffold(
      backgroundColor:  Colors.transparent,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.transparent,
        child:
        Column(children: [
          
        Expanded(
          child: 
        PageView(
              controller: controller,
              onPageChanged: (index){
                setState(() {
                  isLast = index == 2;
                });
              },
              children: [
                WalkthroughInitialScreenWidget(),
                WalkthroughTwoScreen(),
                WalkthroughThreeScreen(),
              ],
            )
          ),
      

        
isLast?
  Padding(padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
    
       ):
        
        Padding(padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 50),
       child: Row(children: [
          TextButton(onPressed: (){
            controller.jumpToPage(2);
            
          },
          child: Text("Skip")
          ),
          Spacer(),
          TextButton(onPressed: (){
            controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
            
          },
          child: Text("Next")
          )
        ],))
          
          ])),
    

    );
     
  }
}