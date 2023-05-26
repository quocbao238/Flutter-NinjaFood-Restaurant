part of 'helper.dart';

String formatPriceToVND(dynamic price) {
  String _result = '';
  final formatter = NumberFormat.currency(locale: 'vi_VN', symbol: '');
  _result = formatter.format(price);
  return _result.trim();
}

bool compareTwoDateTimeIsSameDay(DateTime dateTime1, DateTime dateTime2) {
  return dateTime1.year == dateTime2.year && dateTime1.month == dateTime2.month && dateTime1.day == dateTime2.day;
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
  final _date = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));
  final _startWeek = _date.subtract(Duration(days: _date.weekday - 1));
  final _endWeek = _date.add(Duration(days: DateTime.daysPerWeek - _date.weekday + 1));
  return getListDateTimeBetweenTwoDateTime(_startWeek, _endWeek);
}

List<DateTime> getListDateTimeInYear(String timestamp) {
  final _date = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));
  final _startYear = DateTime(_date.year, 1, 1);
  final _endYear = DateTime(_date.year + 1, 1, 1);
  return getListDateTimeBetweenTwoDateTime(_startYear, _endYear);
}

List<DateTime> getListDateTimeBetweenTwoDateTime(DateTime timeStart, DateTime timeEnd) {
  final _listDay = <DateTime>[];
  for (var i = timeStart; i.isBefore(timeEnd); i = i.add(Duration(days: 1))) {
    _listDay.add(i);
  }
  return _listDay;
}

List<DateTime> getListDayInMonth(String timestamp) {
  final _date = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));
  final _startMonth = DateTime(_date.year, _date.month, 1);
  final _endMonth = DateTime(_date.year, _date.month + 1, 1);
  return getListDateTimeBetweenTwoDateTime(_startMonth, _endMonth);
}

String getDayInWeek(DateTime dateTime) {
  switch (dateTime.weekday) {
    case 1:
      return 'Mon';
    case 2:
      return 'Tue';
    case 3:
      return 'Wed';
    case 4:
      return 'Thu';
    case 5:
      return 'Fri';
    case 6:
      return 'Sat';
    case 7:
      return 'Sun';
    default:
      return '';
  }
}

String getMonthInYear(int index) {
  switch (index) {
    case 1:
      return 'Jan';
    case 2:
      return 'Feb';
    case 3:
      return 'Mar';
    case 4:
      return 'Apr';
    case 5:
      return 'May';
    case 6:
      return 'Jun';
    case 7:
      return 'Jul';
    case 8:
      return 'Aug';
    case 9:
      return 'Sep';
    case 10:
      return 'Oct';
    case 11:
      return 'Nov';
    case 12:
      return 'Dec';
    default:
      return '';
  }
}
