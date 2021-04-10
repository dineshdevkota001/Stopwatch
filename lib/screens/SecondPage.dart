import 'package:flutter/material.dart';
import 'package:ink/screens/components/CountCollector.dart';
import './components/Counter.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key key}) : super(key: key);
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final GlobalKey<CounterState> _counterState = GlobalKey<CounterState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Counter(key: _counterState, start: true),
          ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Stop')),
          CountCollector()
        ]),
      ),
    );
  }
}
