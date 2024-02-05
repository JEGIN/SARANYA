import 'package:flutter/material.dart';

class Firsttab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.deepPurple[100],
        child: Center(
            child: Text(
          "Welcome to Home!!",
          style: TextStyle(fontSize: 40),
        )));
  }
}
