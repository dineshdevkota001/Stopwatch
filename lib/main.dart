import 'package:flutter/material.dart';
import "LandingPage.dart";
void main(){
 runApp(Stopwatch());
}

class Stopwatch extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'INK',
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home : LandingPage(title: 'INK'),
    );
  }
}