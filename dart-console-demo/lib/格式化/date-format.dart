void main() {
  print(dateDelByMonth(11));
}

dateDelByMonth(int month) {
  DateTime dateTime = DateTime.now();
  DateTime newDate;
  print(dateTime.month);
  if (dateTime.month < month) {
    newDate = DateTime(dateTime.year, dateTime.month - month, dateTime.day);
  } else {
    newDate = DateTime(dateTime.year, dateTime.month - month, dateTime.day);
  }
  return newDate;
}

dateAdd() {
  DateTime dateTime = DateTime.now();
  print(dateTime);
  print(dateTime.add(Duration(days: 31)));
}

parse() {
  var d1 = DateTime.parse('2018-10-10 09:30');
  print(d1.millisecondsSinceEpoch);
}
