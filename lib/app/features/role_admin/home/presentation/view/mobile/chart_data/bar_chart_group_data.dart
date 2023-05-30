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
