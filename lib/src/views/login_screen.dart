import 'package:application1/global/app_urls.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../global/assets_urls.dart';

class LoginScreenWidget extends StatefulWidget {
  const LoginScreenWidget({super.key});

  @override
  State<LoginScreenWidget> createState() => _LoginScreenWidgetState();
}

class _LoginScreenWidgetState extends State<LoginScreenWidget> {
TextEditingController  loginController =TextEditingController();


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            SizedBox(height: 50,),
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  mainAxisSize: MainAxisSize.max,
  children: [
    Container(
      height: MediaQuery.of(context).size.height*0.1,
      width: MediaQuery.of(context).size.width*0.20,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AssetsPath.splashLogo1),fit: BoxFit.fill)),
      ),
    
  ],
),
   SizedBox(
    height: 30,
   ) ,
   Padding(padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
   child:
   TextFormField(
    keyboardType: TextInputType.emailAddress,
    controller: loginController,
    validator: (value!)
      if(value.isEmpty){
        return "Please fill the emailid"
    },
    decoration:InputDecoration(
      labelText: "Email",
  
      labelStyle: TextStyle(
        fontSize: 26,fontWeight: FontWeight.bold,color: Colors.blueAccent
      ),
      border: OutlineInputBorder(
           borderRadius: const BorderRadius.all(Radius.circular(10.0)),

      )

    ),
   )
   )

        ],),
      )
    );
  }
}