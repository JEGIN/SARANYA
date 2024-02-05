import 'package:application1/tabs/tab1.dart';
import 'package:flutter/material.dart';



class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
        title: Text("TAB BAR"),
      ),
      body: Column(
        children: [
          TabBar(tabs: [
            Tab(
              icon: Icon(
                Icons.home,
                color: Colors.deepPurpleAccent,
                
              ),
            ),
             Tab(
              icon: Icon(
                Icons.settings,
                color: Colors.deepPurpleAccent,  
              ),
            ),
             Tab(
              icon: Icon(
                Icons.person,
                color: Colors.deepPurpleAccent,
                
              ),
            ),
                   ]),
                   Expanded(
                    child: TabBarView(children: [
                      Firsttab(),
                    // Container(
                    //   color: Colors.blueAccent,
                    //   child: Center(
                    //     child: Text("Welcome to Home!!")
                    //   ),),
                       Container(
                        color: Colors.pink,
                      child: Center(
                        child: Text("Welcome to Settings")
                      ),),
                       Container(
                        color: Colors.redAccent,
                      child: Center(
                        child: Text("Welocome Back!!",)
                      ),),


                   ])
      )],
      )
      
    ));
  }
}
