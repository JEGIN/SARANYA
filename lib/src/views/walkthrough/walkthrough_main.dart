
import '../../../global/app_urls.dart';
import '../login_screen.dart';

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
      extendBody:true,
      backgroundColor:  Colors.transparent,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.transparent,
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
            )),
            
            
            bottomNavigationBar: 

            isLast?
            
            Padding(padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
         child:    Container(
              height: MediaQuery.of(context).size.height*0.06,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10),
                color: Colors.white
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        
                  
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreenWidget()));
                          });
                    },
          
            child:Text('Login',style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),)
            
            )]),
            )):Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    controller.jumpToPage(2);
                  },

                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),


                  child:Container(

                  
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white
                    ),

                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),


                
                
            child:  Text('Skip',style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black
                
              )))))),
               GestureDetector(
                  onTap: (){
                    controller.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn
                    );
                  },

                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),


                  child:Container(

                  
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),

                      color: Colors.white
                    ),

                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),


                
                
            child:  Text('Next',style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black
                
              )))))),
            ],)


            );
        
      

     
  }
}