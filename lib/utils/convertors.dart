import 'package:intl/intl.dart';

double fahrenheitToCelsius(double? celsius){
  return (celsius! - 32) * 5/9;
}

String milliToDate(int ?timeStamp){
  return timeStamp==null?"":DateFormat("MMM dd E").format(DateTime.fromMillisecondsSinceEpoch(timeStamp!*1000));
}

String milliToDateTime(int ?timeStamp){
  return timeStamp==null?"":  DateFormat("dd/MM/yyyy").format(DateTime.fromMillisecondsSinceEpoch(timeStamp!*1000));
}

String milliToHourly(int ?timeStamp){
  return timeStamp==null?"": DateFormat("HH:mm").format(DateTime.fromMillisecondsSinceEpoch(timeStamp!*1000));
}

String milliToWeek(int ?timeStamp){
  return timeStamp==null?"": DateFormat("EEEE").format(DateTime.fromMillisecondsSinceEpoch(timeStamp!*1000));
}

int tempToInt(double? temp){
  return (temp??0).ceilToDouble().toInt();
}