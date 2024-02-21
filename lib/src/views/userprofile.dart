import 'dart:html';

import 'package:application1/global/app_urls.dart';
import 'package:application1/global/assets_urls.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class UserProfileScreenWidget extends StatefulWidget {
  const UserProfileScreenWidget({super.key});

  @override
  State<UserProfileScreenWidget> createState() =>
      _UserProfileScreenWidgetState();
}

class _UserProfileScreenWidgetState extends State<UserProfileScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xffd1d7e5), Color(0xffeae1f4)])),
      child: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 30,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blueGrey,
                  image: DecorationImage(
                      image: NetworkImage(AssetsPath.splashnet),
                      fit: BoxFit.fill)),
            ),
          ]),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                " Saranya",
                style: TextStyle(fontSize: 20, color: Colors.black),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Padding(padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
        child:  Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.calendar_month),
              Text(
                " Joined on this June 2009",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ],
          )),
          SizedBox(
            height: 30,
          ),
          Padding(padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
        child:  Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("10000"),
                  SizedBox(
                    height: 16,
                  ),
                  Text("Total Post"),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("10097"),
                  SizedBox(
                    height: 16,
                  ),
                  Text("Followers"),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("1100"),
                  SizedBox(
                    height: 16,
                  ),
                  Text("Following"),
                ],
              ),
            ])),
            SizedBox(height: 20,),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    )),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),

                    Padding(padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child:  Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
 Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(colors: [Color(0xffe9e7f5), Color(0xfffbe1ea)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0.2,0.9],
                            tileMode: TileMode.clamp

                            ),
                          ),

                          child:
                          Padding(padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                          child:   Icon(Icons.payment)),
                        ),
                     SizedBox(width: 10,),
                        Text("paymet"),
                      ],
                    ),

                    Icon(Icons.chevron_right),
                    ],)),
                   
                      SizedBox(
                      height: 30,
                    ),

                    Padding(padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child:  Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
 Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(colors: [Color(0xffe9e7f5), Color(0xfffbe1ea)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0.2,0.9],
                            tileMode: TileMode.clamp

                            ),
                          ),

                          child:
                          Padding(padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                          child:   Icon(Icons.payment)),
                        ),
                     SizedBox(width: 10,),
                        Text("paymet"),
                      ],
                    ),

                    Icon(Icons.chevron_right),
                    ],)),
                      SizedBox(
                      height: 30,
                    ),

                    Padding(padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child:  Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
 Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(colors: [Color(0xffe9e7f5), Color(0xfffbe1ea)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0.2,0.9],
                            tileMode: TileMode.clamp

                            ),
                          ),

                          child:
                          Padding(padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                          child:   Icon(Icons.payment)),
                        ),
                     SizedBox(width: 10,),
                        Text("paymet"),
                      ],
                    ),

                    Icon(Icons.chevron_right),
                    ],)),
                      SizedBox(
                      height: 30,
                    ),

                    Padding(padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child:  Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
 Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(colors: [Color(0xffe9e7f5), Color(0xfffbe1ea)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0.2,0.9],
                            tileMode: TileMode.clamp

                            ),
                          ),

                          child:
                          Padding(padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                          child:   Icon(Icons.payment)),
                        ),
                     SizedBox(width: 10,),
                        Text("paymet"),
                      ],
                    ),

                    Icon(Icons.chevron_right),
                    ],)),
                      SizedBox(
                      height: 30,
                    ),

                    Padding(padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child:  Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
 Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(colors: [Color(0xffe9e7f5), Color(0xfffbe1ea)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0.2,0.9],
                            tileMode: TileMode.clamp

                            ),
                          ),

                          child:
                          Padding(padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                          child:   Icon(Icons.payment)),
                        ),
                     SizedBox(width: 10,),
                        Text("paymet"),
                      ],
                    ),

                    Icon(Icons.chevron_right),
                    ],)),
                      SizedBox(
                      height: 30,
                    ),

                    Padding(padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child:  Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
 Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(colors: [Color(0xffe9e7f5), Color(0xfffbe1ea)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0.2,0.9],
                            tileMode: TileMode.clamp

                            ),
                          ),

                          child:
                          Padding(padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                          child:   Icon(Icons.payment)),
                        ),
                     SizedBox(width: 10,),
                        Text("paymet"),
                      ],
                    ),

                    Icon(Icons.chevron_right),
                    ],)),
                   
                  ],
                ),
              )
          
        ]),
      ),
    ));
  }
}
