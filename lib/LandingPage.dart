import 'package:flutter/material.dart';
import 'screens/SecondPage.dart';
import 'screens/components/Counter.dart';
class LandingPage extends StatelessWidget{
  LandingPage({Key key, this.title}): super(key: key);
  final String title;
  @override
  Widget build(BuildContext context){
    return Scaffold(
           body: Center(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
             children:[
               Counter(start: false),
               ElevatedButton(
              onPressed: (){
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context)=> SecondPage())
               );
             },
             child:Text('Start')
           ),
                 ]
             )
           ),

    );
  }
}