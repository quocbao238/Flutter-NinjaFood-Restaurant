

import 'package:intl/intl.dart';


String formatPriceToVND(dynamic price) {
  String _result = '';
  final formatter = NumberFormat.currency(locale: 'vi_VN',symbol: '');
  _result =  formatter.format(price);
  return _result.trim();
}