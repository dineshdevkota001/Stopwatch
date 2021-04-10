import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import '../../class/TimerTime.dart';
import '../../class/TimeList.dart';

class Counter extends StatefulWidget {
  final bool start;
  Counter({Key key, this.start}) : super(key: key);

  @override
  CounterState createState() => CounterState();
}

class CounterState extends State<Counter> {
  int _minute = 0;
  int _second = 0;
  int _microsecond = 0;
  bool _reset = false;
  static const int _increment = 1;
  static const String _default = '00:00';
  String _display = _default;
  String _microDisp = '00';
  var timer, microTimer;

  startTimer() {
    timer = Timer.periodic(
        Duration(seconds: 1),
        (Timer t) => setState(() {
              _second = (_second + 1) % 60;
              _minute = (_second == 59) ? (_minute + 1) : _minute;
              _display = _minute.toString().padLeft(2, '0') +
                  ':' +
                  _second.toString().padLeft(2, '0');
            }));
    microTimer = Timer.periodic(
        Duration(microseconds: _increment),
        (Timer t) => setState(() {
              _microsecond = (_microsecond + _increment) % 1000;
              _microDisp = _microsecond.toString().padLeft(3, '0');
            }));
  }
  addToList(BuildContext context){

    context.read<TimeList>().add(
        new TimerTime(_minute, _second, _microsecond));

  }
  reinitialize(lapContext){
    setState(() {
      {
        timer.cancel();
        microTimer.cancel();
        _minute = 0;
        _second = 0;
        _microsecond = 0;
        _display = _default;
        _microDisp = '000';
        _reset = true;
        lapContext.clear();
      }
    });
  }
  @override
  void initState() {
    super.initState();
    if (widget.start) {
      this.startTimer();
    }
  }

  @override
  void dispose() {
    timer.cancel();
    microTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var lapContext = context.read<TimeList>();
    return Container(
        padding: EdgeInsets.fromLTRB(30.0, 200.0, 30.0, 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_display, style: Theme.of(context).textTheme.headline1),
            Text(
              _microDisp,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            widget.start ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed:(){reinitialize(lapContext);},
                    child: Text('Reset')),

                // if reset is pressed show restart
                _reset ? ElevatedButton(
                        onPressed: () {
                          _reset = false;
                          startTimer();
                        },
                        child: Text('Restart'))
                    // second optio or
                    : ElevatedButton(
                        onPressed: () {
                          lapContext.add(
                              new TimerTime(_minute, _second, _microsecond));
                        },
                        child: Text('Lap')),
              ],
            ):Text('Stopwatch',style: Theme.of(context).textTheme.headline3)
          ],
        ));
  }
}
