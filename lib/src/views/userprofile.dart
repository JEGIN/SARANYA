import 'dart:html';

import 'package:application1/global/app_urls.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class UserProfileScreenWidget extends StatefulWidget {
  const UserProfileScreenWidget({super.key});

  @override
  State<UserProfileScreenWidget> createState() => _UserProfileScreenWidgetState();
}

class _UserProfileScreenWidgetState extends State<UserProfileScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(gradient: LinearGradient(colors:[Color(0xffd1d7e5),Color(0xffeae1f4)])),
        child: 
        SingleChildScrollView(
          
         child: 
          Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                   height: 100,
                   width: 100, 
                   decoration: BoxDecoration(shape: BoxShape.circle,color:Colors.blueGrey),
                  )
                  
                ],
              ),
                SizedBox(
                height: 30,
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                   " Saranya",
                    style: TextStyle(fontSize: 20,color: Colors.black),
                  )
                  
                ],
              ),
               SizedBox(
                height: 30,
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.calendar_month),
                  Text(
                   " Joined on this June 2009",
                    style: TextStyle(fontSize: 20,color: Colors.black),
                  ),
                ],
              ),
          SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children:[
                  Text("10000"),
                  SizedBox(
                    height: 16,
                  ),
                  Text("Total Post"),
                  
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                    children:[
                  Text("10097"),
                  SizedBox(
                    height: 16,
                  ),
                  Text("Followers"),
                  
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                    children:[
                  Text("1100"),
                  SizedBox(
                    height: 16,
                  ),
                  Text("Following"),
                  
                ],
              ),
              
             
              Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,  
              decoration: BoxDecoration(color: Colors.white,
        
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),

              )
              ),
              child: Column(
                children: [
                  SizedBox(
                height: 30,
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.payment),
                  Text("paymet"),
                  
                ],
              ),
               SizedBox(
                height: 30,
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.favorite),
                  Text("Favourites"),
                  
                ],
              ),
               SizedBox(
                height: 30,
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.settings),
                  Text("Settings"),
                  
                ],
              ),
               SizedBox(
                height: 30,
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.start,
                
                children: [
                  Icon(Icons.language),
                  Text("Language"),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                  children:[
                    
                  Text("English"),
                 ] )
                  ]
                  ),
                
               SizedBox(
                height: 30,
              ),
           Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.dark_mode),
                  Text("Dark Mode"),
                  
                ],
              ),   

                ],
              ),

              )
            ],
          )
      ]  ),
      ),
     ) );
  }
}