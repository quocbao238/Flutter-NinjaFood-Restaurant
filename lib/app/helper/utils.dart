import 'package:intl/intl.dart';

String formatPriceToVND(dynamic price) {
  String _result = '';
  final formatter = NumberFormat.currency(locale: 'vi_VN', symbol: '');
  _result = formatter.format(price);
  return _result.trim();
}

String createTimeStamp() {
  return DateTime.now().millisecondsSinceEpoch.toString();
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
