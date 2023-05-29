import 'dart:math';

import 'package:intl/intl.dart';
import 'package:ninjafood/app/helper/helper.dart';

class ChartData {
  final int index;
  final String bottomTitle;
  final String toolTip;
  final DateTime dateTime;
  final int month;
  final double value;

  ChartData(
      {required this.bottomTitle,
      required this.toolTip,
      required this.month,
      required this.index,
      required this.dateTime,
      required this.value});
}

// static List<ChartData> fakeDataWeek() {
//   final days = getListCurrentDayInWeek(createTimeStamp());
//   return days
//       .map((e) => ChartData(
//             bottomTitle: getDayInWeek(e),
//             toolTip: getDayInWeek(e),
//             index: days.indexOf(e),
//             dateTime: e,
//             value: Random().nextInt(100).toDouble(),
//           ))
//       .toList();
// }
//
// static List<ChartData> fakeDataMonth() {
//   final days = getListDayInMonth(createTimeStamp());
//   return days
//       .map((e) => ChartData(
//             bottomTitle: e.day % 2 == 0 ? '' : e.day.toString(),
//             toolTip: DateFormat('dd/MM/yyyy').format(e),
//             index: days.indexOf(e),
//             dateTime: e,
//             value: Random().nextInt(100).toDouble(),
//           ))
//       .toList();
// }
//
// static List<ChartData> fakeDataYear() {
//   return List.generate(
//     12,
//     (index) => ChartData(
//       bottomTitle: (index + 1).toString(),
//       toolTip: "Month: " + (index + 1).toString(),
//       index: index,
//       dateTime: DateTime.now().subtract(Duration(days: index)),
//       value: Random().nextInt(100).toDouble(),
//     ),
//   );
// }}
