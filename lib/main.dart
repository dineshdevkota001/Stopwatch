import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "LandingPage.dart";
import 'class/TimeList.dart';
void main(){
 runApp(Stopwatch());
}

class Stopwatch extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return ChangeNotifierProvider(
        create:(context)=>TimeList(),
    child: MaterialApp(
      title: 'INK',
      theme: ThemeData(
        primaryColor: Colors.blue,
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontFamily: 'Corben',
            fontWeight: FontWeight.w200,
            fontSize: 30
          ),
          button: TextStyle(
            fontSize: 40
          )
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(

        )
      ),
      home : LandingPage(title: 'INK'),
    ));
  }
}