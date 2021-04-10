import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../class/TimeList.dart';

class CountCollector extends StatelessWidget {
  List<Widget> printLaps(List<String> laps, context) {
    return laps
        .map((lap) => Container(
              child: Text(lap, style: Theme.of(context).textTheme.bodyText1),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    var _laps = context.watch<TimeList>().getAll();
    return Consumer<TimeList>(builder: (context, timelist, child) {
      return  Expanded(
              flex: 1,
              child: Container(
                  margin: EdgeInsets.all(20.0),
                  child:
                  SingleChildScrollView(
                child: Column(
                  children:_laps.length == 0 ? [Text('Laps', style: Theme.of(context).textTheme.headline2)]: [ ]..addAll(printLaps(_laps, context)),
                ),
              )));
    });
  }
}
