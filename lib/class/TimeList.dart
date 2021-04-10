import 'package:flutter/foundation.dart';

import './TimerTime.dart';
class TimeList extends ChangeNotifier{
  List<String> lapList = <String>['00:00:000','11:11:111'];
  TimeList(){
    lapList = [];
  }
  void add(TimerTime time){
    lapList.add(time.display());
    notifyListeners();
  }
  void clear(){
    lapList.clear();
    notifyListeners();
  }
  List<String> getAll (){
    return lapList;
  }
}