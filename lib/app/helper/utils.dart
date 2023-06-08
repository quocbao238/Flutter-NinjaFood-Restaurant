part of 'helper.dart';

String formatPriceToVND(dynamic price) {
  String _result = '';
  final formatter = NumberFormat.currency(locale: 'vi_VN', symbol: '');
  _result = formatter.format(price);
  return _result.trim();
}

bool compareTwoDateTimeIsSameDay(DateTime dateTime1, DateTime dateTime2) {
  return dateTime1.year == dateTime2.year &&
      dateTime1.month == dateTime2.month &&
      dateTime1.day == dateTime2.day;
}

String createTimeStamp() {
  return DateTime.now().millisecondsSinceEpoch.toString();
}

DateTime convertTimeStampToDateTime(String timestamp) {
  return DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));
}

String convertTimeStamp(String timestamp) {
  var date = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));
  var formatter = DateFormat('HH:mm dd/MM/yyyy');
  String formatted = formatter.format(date);
  return formatted;
}

String convertTimeStampToHour(String timestamp) {
  var date = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));
  var formatter = DateFormat('HH:mm');
  String formatted = formatter.format(date);
  return formatted;
}

String getExpiresDayLaterByTwoDateTime(String timeStart, String timeEnd) {
  final _dateStart = DateFormat('dd/MM/yyyy').parse(timeStart);
  final _dateEnd = DateFormat('dd/MM/yyyy').parse(timeEnd);
  final difference = _dateEnd.difference(_dateStart).inDays;
  return difference.toString();
}

List<DateTime> getListCurrentDayInWeek(String timestamp) {
  var _date = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));
  _date = DateTime(_date.year, _date.month, _date.day);
  final _startWeek = _date.subtract(Duration(days: _date.weekday - 1));
  final _endWeek =
      _date.add(Duration(days: DateTime.daysPerWeek - _date.weekday + 1));
  return getListDateTimeBetweenTwoDateTime(_startWeek, _endWeek);
}

List<DateTime> getListDateTimeInYear(String timestamp) {
  var _date = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));
  _date = DateTime(_date.year, _date.month, _date.day);
  final _startYear = DateTime(_date.year, 1, 1);
  final _endYear = DateTime(_date.year + 1, 1, 1);
  return getListDateTimeBetweenTwoDateTime(_startYear, _endYear);
}

List<DateTime> getListMonthInYear() {
  final _listMonth = <DateTime>[];
  for (var i = 1; i <= 12; i++) {
    _listMonth.add(DateTime(2021, i, 1));
  }
  return _listMonth;
}

List<DateTime> getListDateTimeBetweenTwoDateTime(
    DateTime timeStart, DateTime timeEnd) {
  final _listDay = <DateTime>[];
  for (var i = timeStart; i.isBefore(timeEnd); i = i.add(Duration(days: 1))) {
    _listDay.add(i);
  }
  return _listDay;
}

List<DateTime> getListDayInMonth(String timestamp) {
  var _date = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));
  _date = DateTime(_date.year, _date.month, _date.day);
  final _startMonth = DateTime(_date.year, _date.month, 1);
  final _endMonth = DateTime(_date.year, _date.month + 1, 1);
  return getListDateTimeBetweenTwoDateTime(_startMonth, _endMonth);
}

String getDayInWeek(DateTime dateTime) => switch (dateTime.weekday) {
      1 => 'Mon',
      2 => 'Tue',
      3 => 'Wed',
      4 => 'Thu',
      5 => 'Fri',
      6 => 'Sat',
      7 => 'Sun',
      _ => ''
    };

String getMonthInYear(int index) => switch (index) {
      1 => 'January',
      2 => 'February',
      3 => 'March',
      4 => 'April',
      5 => 'May',
      6 => 'June',
      7 => 'July',
      8 => 'August',
      9 => 'September',
      10 => 'October',
      11 => 'November',
      12 => 'December',
      _ => ''
    };
