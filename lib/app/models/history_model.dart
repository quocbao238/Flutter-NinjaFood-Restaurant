import 'package:ninjafood/app/models/cart_model.dart';

enum HistoryStatus {
  pending('Pending', 'pending'),
  confirmed('Confirmed', 'confirmed'),
  shipped('Shipped', 'shipped'),
  delivered('Delivered', 'delivered'),
  cancelled('Cancelled', 'cancelled');

  final String status;
  final String json;

  const HistoryStatus(this.status, this.json);
}

class HistoryOrderModel {
  String uid;
  double subTotal;
  double serviceFee;
  double total;
  double discount;
  List<CartModel> carts;
  HistoryStatus status;
  String createdAt;

  HistoryOrderModel(
      {required this.uid,
      required this.subTotal,
      required this.serviceFee,
      required this.total,
      required this.discount,
      required this.createdAt,
      required this.carts,
      required this.status});

  factory HistoryOrderModel.fromJson(Map<String, dynamic> json) {
    final historyModel =  HistoryOrderModel(
        uid: json['uid'] as String,
        createdAt: json['createdAt'] as String,
        subTotal: json['subTotal'] as double,
        serviceFee: json['serviceFee'] as double,
        discount: json['discount'] as double,
        total: json['total'] as double,
        carts: (json['carts'] as List<dynamic>).map((e) => CartModel.fromJson(e as Map<String, dynamic>)).toList(),
        status: HistoryStatus.values.firstWhere((element) => element.json == json['status'] as String));
    return historyModel;
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'subTotal': subTotal,
      'discount': discount,
      'createdAt': createdAt,
      'serviceFee': serviceFee,
      'total': total,
      'carts': carts.map((e) => e.toJson()).toList(),
      'status': status.json
    };
  }

// HistoryOrderModel copyWidth({List<CartModel>? carts, HistoryStatus? status}) {
//   final _subTotal = _getSubTotal(carts ?? this.carts);
//   final _serviceFee = _calculateServiceFee(serviceFee, _subTotal);
//   return HistoryOrderModel(
//       uid: this.uid,
//       subTotal: _subTotal,
//       serviceFee: _serviceFee,
//       total: _subTotal + _serviceFee,
//       carts: carts ?? this.carts,
//       status: status ?? this.status);
// }
//
// double _getSubTotal(List<CartModel> _carts) {
//   if (_carts.isEmpty) return total;
//   return _carts.fold(
//       total,
//       (previousValue, element) =>
//           previousValue +
//           (element.quantity * (element.productModel.priceRange?.minimumPrice?.finalPrice?.value ?? 0)));
// }
//
// double _calculateServiceFee(double _serviceFee, double _subTotal) {
//   return (_subTotal * _serviceFee) / 100;
// }
}
