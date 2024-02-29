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
TextEditingController  passwordController =TextEditingController();
GlobalKey<FormState> _loginKey = GlobalKey<FormState>();
bool isVisible = false;
bool isUpperCase = false;
bool isLowerCase = false;
bool isDigit = false;
bool isSpecialChar = false;


  @override
  Widget build(BuildContext context) {
    return 
    Form( 
      key: _loginKey,
      
      child: 


    
     Scaffold(
      body:
      
      
      Container(
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
    validator: (value){
       bool isValid = EmailValidator.validate(value!);
      if(value!.isEmpty){
        return "Please fill the emailid";
      }else if(isValid==false){
        return 'Please enter a valid email';
      }
    },
     
    
    decoration:InputDecoration(
      suffixIcon: Icon(Icons.mail),
      labelText: "Email",
  
      labelStyle: TextStyle(
        fontSize: 26,fontWeight: FontWeight.bold,color: Colors.blueAccent
      ),
      border: OutlineInputBorder(
           borderRadius: const BorderRadius.all(Radius.circular(10.0)),

      )

    ),
   )
   ),
   SizedBox(
    height: 30,
   ) ,
   Padding(padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
   child:
   TextFormField(
    keyboardType: TextInputType.visiblePassword,
    obscureText:  isVisible? false : true,
    controller: passwordController,
    validator: (value){
      if (value!.isEmpty) {
                return 'Password is required';
              } else if (isLowerCase == false) {
                return 'Password must contain at least one lowercase letter';
              } else if (isUpperCase == false) {
                return 'Password must contain at least one uppercase letter';
              } else if (isDigit == false) {
                return 'Password must contain at least one digit';
              } else if (isSpecialChar == false) {
                return 'Password must contain at least one special character';
              }
},
    
    onChanged: (value) {
      setState(() {
        _validatePassword(value);
      });
    },
     
    
    decoration:InputDecoration(
      suffixIcon: GestureDetector(onTap: (){
        setState(() {
          isVisible = !isVisible;
          print(isVisible);
        });
      }, child: isVisible? Icon(Icons.visibility): Icon(Icons.visibility_off)),
      labelText: "Password",
  
      labelStyle: TextStyle(
        fontSize: 26,fontWeight: FontWeight.bold,color: Colors.blueAccent
      ),
      border: OutlineInputBorder(
           borderRadius: const BorderRadius.all(Radius.circular(10.0)),

      )

    ),
   )
   ),

   SizedBox(height: 100,),
   Padding(padding: EdgeInsetsDirectional.fromSTEB(50, 0, 50, 0),
child:

InkWell(
  onTap: (){
    if(_loginKey.currentState!.validate()){
       print("validate");
    }else{
      print("not validate");
    }
  },
child:Container(
  height: 50,
  width: MediaQuery.of(context).size.width,
  decoration: BoxDecoration(
    color: Colors.orangeAccent,
    borderRadius: BorderRadius.circular(10)

  ),
  child: Center(
    child:Text('Login',style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,color: Colors.white),)
  ),
))),
  

        ],),
      )
   
    ));
  }
  void _validatePassword(String password) {
    setState(() {
      isUpperCase = password.contains(RegExp(r'[A-Z]'));
      isLowerCase = password.contains(RegExp(r'[a-z]'));
      isDigit = password.contains(RegExp(r'\d'));
      isSpecialChar = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
      // passwordsMatch = password == confirmPassword;
      print( 'Upper ' + isUpperCase.toString());
      print( 'Lower ' + isLowerCase.toString());
      print( 'Upper ' + isDigit.toString());
      print( 'Upper ' + isSpecialChar.toString());
});
}
}