class TimerTime{
  int _second,_minute,_microsec;
  String _displaytime;
  TimerTime(minute, second, microsec){
    _second = second;
    _minute = minute;
    _microsec = microsec;
    this._makeString();
  }
  _makeString(){
    _displaytime = _minute.toString().padLeft(2,'0')+':'+_second.toString().padLeft(2,'0')+':'+_microsec.toString().padLeft(3,'0');
  }
  display(){
    return _displaytime;
  }
}