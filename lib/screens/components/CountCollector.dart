import 'package:flutter/material.dart';

class CountCollector extends StatefulWidget{
  CountCollector({Key key}): super(key:key);
  @override
  _CountCollectorState createState() => _CountCollectorState();
}

class _CountCollectorState extends State<CountCollector> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Second Page'),
      ),
    );
  }
}