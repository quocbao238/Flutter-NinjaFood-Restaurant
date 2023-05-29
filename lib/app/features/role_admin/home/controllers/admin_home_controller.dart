import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ninjafood/app/controllers/delivery_controller.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/features/role_admin/home/presentation/view/mobile/chart_data/bar_chart_group_data.dart';
import 'package:ninjafood/app/helper/helper.dart';
import 'package:ninjafood/app/models/comment_model.dart';
import 'package:ninjafood/app/models/history_model.dart';
import 'package:ninjafood/app/services/database_service/database_service.dart';

const _logName = 'AdminHomeController';

enum FilterChart {
  week('Chart_Filter_Week'),
  month('Chart_Filter_Month'),
  year('Chart_Filter_Year');

  final String translation;

  const FilterChart(this.translation);

  List<DateTime> generateListDate() => switch (this) {
        FilterChart.week => getListCurrentDayInWeek(createTimeStamp()),
        FilterChart.month => getListDayInMonth(createTimeStamp()),
        FilterChart.year => getListDateTimeInYear(createTimeStamp()),
      };
}

class AdminHomeController extends BaseController {
  final DeliveryController deliveryController = DeliveryController.instance;

  final DatabaseService databaseService = DatabaseService.instance;

  // Revenue chart
  final RxList<ChartData> lstRevenuesChart = <ChartData>[].obs;

  // Order charts
  final RxList<ChartData> lstOrdersChart = <ChartData>[].obs;

  //  Review Charts
  final RxList<ChartData> lstReviewsChart = <ChartData>[].obs;

  final revenuesFilterChartType = FilterChart.week.obs;
  final ordersFilterChartType = FilterChart.week.obs;
  final reviewsFilterChartType = FilterChart.week.obs;

  final RxString todayRevenue = '0.0'.obs; // '0.0
  final RxString todayOrder = '0'.obs;
  final RxString totalReview = '0'.obs;

  @override
  void onInit() {
    final lstOrderModel = deliveryController.lstOrderModel.toList();
    todayRevenue.value = calculateTotalPriceToday(lstOrderModel);
    todayOrder.value = lstOrderModel.length.toString();
    _listens();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _listens() async {
    deliveryController.lstOrderModel.listen((_orders) {
      todayRevenue.value = calculateTotalPriceToday(_orders);
      todayOrder.value = _orders.length.toString();

      createChartData(revenuesFilterChartType.value).then((value) => lstRevenuesChart.assignAll(value));
      createChartData(ordersFilterChartType.value).then((value) => lstOrdersChart.assignAll(value));
    });

    databaseService.listenRating().listen((QuerySnapshot<Map<String, dynamic>> event) {
      final List<CommentModel> _result = event.docs.map((e) => CommentModel.fromJson(e.data())).toList();
      totalReview.value = _result.length.toString();
    });

    print('$_logName: "lstRevenuesChart $lstRevenuesChart"');
  }

  String calculateTotalPriceToday(List<OrderModel> orders) {
    final _orders = orders.where((element) => element.status == HistoryStatus.done).toList();
    final total = _orders.fold<double>(0, (previousValue, element) => previousValue + element.total);
    return formatPriceToVND(total) + ' VND';
  }

  // Chart

  Future<List<ChartData>> createChartData(FilterChart filterChartType) async {
    {
      var result = <ChartData>[];
      final lstDateTime = filterChartType.generateListDate();
      final response = await databaseService.getListOrderModelByStatus(
          timeStampStart: lstDateTime.first.millisecondsSinceEpoch.toString(),
          timeStampEnd: lstDateTime.last.millisecondsSinceEpoch.toString());
      List<OrderModel> orders = [];

      response.fold((l) => <OrderModel>[], (r) {
        final _filter = r.where((element) => element.status == HistoryStatus.done).toList();
        orders.assignAll(_filter);
      });

      result = lstDateTime.map((e) {
        final listOrderInDay = orders
            .where((element) =>
                compareTwoDateTimeIsSameDay(convertTimeStampToDateTime(element.createdAt), e) &&
                element.status == HistoryStatus.done)
            .toList();
        final total = listOrderInDay.fold<double>(0, (previousValue, element) => previousValue + element.total);
        int index = lstDateTime.indexOf(e);
        return ChartData(
            bottomTitle: filterChartType == FilterChart.week
                ? getDayInWeek(e)
                : filterChartType == FilterChart.month
                    ? e.day % 2 == 0
                        ? DateFormat('d').format(e)
                        : ''
                    : filterChartType == FilterChart.year
                        ? getMonthInYear(e.month)
                        : getDayInWeek(e),
            toolTip: getDayInWeek(e),
            month: e.month,
            index: index,
            dateTime: e,
            value: total);
      }).toList();

      if (filterChartType == FilterChart.year) {
        final _lst = <ChartData>[];
        for (int i = 0; i < 12; i++) {
          final _filter = result.where((element) => element.month == i + 1).toList();
          final total = _filter.fold<double>(0, (previousValue, element) => previousValue + element.value);
          _lst.add(ChartData(
              bottomTitle: (i + 1).toString(),
              toolTip: getMonthInYear(i + 1),
              month: i + 1,
              index: i,
              dateTime: DateTime(2021, i + 1, 1),
              value: total));
        }
        return _lst;
      }

      return result;
    }
  }

  void onFilterRevenueChart(FilterChart filterChartType) {
    revenuesFilterChartType.value = filterChartType;
    createChartData(filterChartType).then((value) => lstRevenuesChart.assignAll(value));
  }
}
