import 'package:flutter/material.dart';
import 'package:ink/screens/SecondPage.dart';
import 'screens/SecondPage.dart';
class LandingPage extends StatefulWidget{
  LandingPage({Key key, this.title}): super(key: key);
  final String title;
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
         body: Center(
           child: ElevatedButton(
           onPressed: (){
             Navigator.push(
               context,
               MaterialPageRoute(builder: (context)=> SecondPage())
             );
           },
           child:Text('Start')
         ),
         ),
     );
  }
}