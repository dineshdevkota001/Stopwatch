import 'package:flutter/material.dart';
import 'components/Counter.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key key}) : super(key: key);
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(children: [
            Counter(),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Stop')),
          ]),
        ),
      ),
    );
  }
}
