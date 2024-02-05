


import '../../global/app_urls.dart';

class FontTypeScreenWidget extends StatelessWidget {
  const FontTypeScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            
            child: SingleChildScrollView(child: 
             Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   Text("日本語を頑張って-- Try Japanese ",style: TextStyle(
                    fontFamily:"Caramel",fontSize: 20,color: Colors.purpleAccent
                   ),),
                   SizedBox(
                    height: 20,
                   ),
                    Text("日本語を頑張って",style: TextStyle(
                      fontFamily: "Skincake",fontSize: 30,color: Colors.blueAccent
                    ),),
                    SizedBox(
                    height: 20,
                   ),
                    Text("日本語を頑張って ",style: TextStyle(
                      fontFamily:"The Quickly",fontSize: 36,color:Colors.deepPurpleAccent )
                      ),
                 
                 SizedBox(
                    height: 20,
                   ),
                    Text("日本語を頑張って",style: TextStyle(
                      fontFamily:"Duckname",fontSize: 40,color:Colors.redAccent )
                      ), 
                      
                       SizedBox(
                    height: 20,
                   ),
                    Text("日本語を頑張って",style: TextStyle(
                      fontFamily:"Easybold",fontSize: 46,color:Colors.amberAccent)
                      ),
                      SizedBox(
                    height: 20,
                   ),
                    Text("日本語を頑張って",style: TextStyle(
                      fontFamily:"Lemon Milk",fontSize: 50,color:Colors.blueGrey)
                      ), 
                       
                        SizedBox(
                    height: 20,
                   ),
                    Text("日本語を頑張って",style: TextStyle(
                      fontFamily:"Snowman",fontSize: 56,color:Colors.greenAccent)
                      ),
                       SizedBox(
                    height: 20,
                   ),
                    Text("日本語を頑張って",style: TextStyle(
                      fontFamily:"Sobread",fontSize: 60,color:Colors.deepPurpleAccent)
                      ),
                                
        
                ]))));
  }
}
