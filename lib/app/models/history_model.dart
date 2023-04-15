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
  bool isRating;

  HistoryOrderModel(
      {required this.uid,
      required this.subTotal,
      required this.serviceFee,
      required this.total,
      required this.discount,
      required this.createdAt,
      required this.carts,
      required this.isRating,
      required this.status});

  factory HistoryOrderModel.fromJson(Map<String, dynamic> json) {
    final historyModel = HistoryOrderModel(
        uid: json['uid'] as String,
        createdAt: json['createdAt'] as String,
        subTotal: double.parse(json['subTotal'].toString()),
        serviceFee: double.parse(json['serviceFee'].toString()),
        discount: double.parse(json['discount'].toString()),
        total: double.parse(json['total'].toString()),
        isRating: json['isRating'] as bool,
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
      'isRating': isRating,
      'carts': carts.map((e) => e.toJson()).toList(),
      'status': status.json
    };
  }

  void updateStatus(HistoryStatus status) {
    this.status = status;
  }

  void updateRating(bool isRating) {
    this.isRating = isRating;
  }
}
