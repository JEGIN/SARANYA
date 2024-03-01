import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../global/app_urls.dart';
import '../../global/assets_urls.dart';

class OTPScreenWidget extends StatefulWidget {
  const OTPScreenWidget({super.key});

  @override
  State<OTPScreenWidget> createState() => _OTPScreenWidgetState();
}

class _OTPScreenWidgetState extends State<OTPScreenWidget> {

GlobalKey<FormState> _verifyKey = GlobalKey<FormState>();
final pinController = TextEditingController();
final focusNode = FocusNode();
final defaultPinTheme = PinTheme(
  width: 56,
  height: 56,
  textStyle: const TextStyle(
    fontSize: 22,
    color: Colors.black,
  ),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(30),
    border: Border.all(color: Colors.black26),
  ),
);

  @override
  Widget build(BuildContext context) {
    return   Form( 
      key: _verifyKey,
      
      child: 


    
     Scaffold(
      body:
      
      
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // SizedBox(height: 50,),
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
    height: 100,
   ) ,
   Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(10, 20, 10, 20),
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    'Enter your OTP',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: 'Jost',
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Directionality(
                                                        // Specify direction if desired
                                                        textDirection:
                                                            TextDirection.ltr,
                                                        child: Pinput(
                                                          length: 6,
                                                          controller:
                                                              pinController,
                                                          focusNode: focusNode,
                                                          androidSmsAutofillMethod:
                                                              AndroidSmsAutofillMethod
                                                                  .smsUserConsentApi,
                                                          listenForMultipleSmsOnAndroid:
                                                              true,
                                                          defaultPinTheme:
                                                              defaultPinTheme,
                                                          separatorBuilder:
                                                              (index) =>
                                                                  const SizedBox(
                                                                      width:
                                                                          10),
                                                          validator: (value) {
                                                            return value ==
                                                                    '222222'
                                                                ? null
                                                                : 'Pin is incorrect';
                                                          },
                                                          // onClipboardFound: (value) {
                                                          //   debugPrint('onClipboardFound: $value');
                                                          //   pinController.setText(value);
                                                          // },
                                                          hapticFeedbackType:
                                                              HapticFeedbackType
                                                                  .lightImpact,
                                                          onCompleted: (pin) {
                                                            debugPrint(
                                                                'onCompleted: $pin');
                                                          },
                                                          onChanged: (value) {
                                                            debugPrint(
                                                                'onChanged: $value');
                                                          },
                                                          cursor: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Container(
                                                                margin:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        bottom:
                                                                            9),
                                                                width: 18,
                                                                height: 1,
                                                                color:
                                                                    Colors.black
                                                                        .withOpacity(
                                                                            0.6),
                                                              ),
                                                            ],
                                                          ),

                                                          focusedPinTheme:
                                                              defaultPinTheme
                                                                  .copyWith(
                                                            decoration:
                                                                defaultPinTheme
                                                                    .decoration!
                                                                    .copyWith(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30),
                                                              border: Border.all(
                                                                  color:
                                                                      Colors. black.withOpacity(0.4)),
                                                            ),
                                                          ),
                                                          submittedPinTheme:
                                                              defaultPinTheme
                                                                  .copyWith(
                                                            decoration:
                                                                defaultPinTheme
                                                                    .decoration!
                                                                    .copyWith(
                                                              color: Colors.orangeAccent,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30),
                                                              border: Border.all(
                                                                  color:
                                                                      Colors. black.withOpacity(0.4)),
                                                            ),
                                                          ),
                                                          errorPinTheme:
                                                              defaultPinTheme
                                                                  .copyBorderWith(
                                                            border: Border.all(
                                                              color: Colors
                                                                  .redAccent,
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ])),

   SizedBox(height: 100,),
   Padding(padding: EdgeInsetsDirectional.fromSTEB(50, 0, 50, 0),
child:

InkWell(
  onTap: (){
    if(_verifyKey.currentState!.validate()){
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
    child:Text('Verify',style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,color: Colors.white),)
  ),
))),
  

        ],),
      )
   
    ));
  }
  }
