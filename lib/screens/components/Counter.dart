import 'package:flutter/material.dart';
import 'dart:async';
class Counter extends StatefulWidget{
  Counter({Key key}): super(key:key);
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _minute = 0;
  int _second = 0;
  var timer;
  final _style = TextStyle(
  fontSize: 50
  );

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) => setState(() {
      _second = (_second +1) % 60;
      _minute = (_second+1 == 59 ) ? _minute++ : _minute;
    })
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(100),
        constraints: BoxConstraints(minWidth: 100, maxWidth: 200),
        child: Row(
          children: [
            Text('$_minute',style: _style),
            Text(' : ', style: _style),
            Text('$_second', style: _style)
          ],
        ),
      ),
    );
  }
}