import 'package:flutter/material.dart';
import 'package:ninjafood/app/models/cart_model.dart';

enum HistoryStatus {
  request('Request', 'request', 'assets/lottie/order_request.json', Colors.blue, ''),
  pending('Pending', 'pending', 'assets/lottie/order_pending.json', Colors.orange, 'admin_pending'),
  delivering('Delivering', 'delivering', 'assets/lottie/order_delivering.json', Colors.blueAccent, 'admin_delivering'),
  delivered('Delivered', 'delivered', 'assets/lottie/order_delivered.json', Colors.lightBlueAccent, 'admin_delivered'),
  cancelled('Cancelled', 'cancel', 'assets/lottie/order_cancel.json', Colors.redAccent, 'admin_cancel'),
  done('Done', 'done', '', Colors.greenAccent, ''),
  all('All', 'all', '', Colors.greenAccent, '');

  final String status;
  final String json;
  final String lottieUrl;
  final Color color;
  final String adminStatus;

  const HistoryStatus(this.status, this.json, this.lottieUrl, this.color, this.adminStatus);
}

class OrderModel {
  String uid;
  String userId;
  double subTotal;
  double serviceFee;
  double total;
  double discount;
  List<CartModel> carts;
  HistoryStatus status;
  String createdAt;
  bool isRating;

  OrderModel(
      {required this.uid,
      required this.subTotal,
      required this.userId,
      required this.serviceFee,
      required this.total,
      required this.discount,
      required this.createdAt,
      required this.carts,
      required this.isRating,
      required this.status});

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    final historyModel = OrderModel(
        uid: json['uid'] as String,
        userId: json['userId'] == null ? '' : json['userId'] as String,
        createdAt: json['createdAt'] as String,
        subTotal: double.parse(json['subTotal'].toString()),
        serviceFee: double.parse(json['serviceFee'].toString()),
        discount: double.parse(json['discount'].toString()),
        total: double.parse(json['total'].toString()),
        isRating: json['isRating'] ?? false,
        carts: (json['carts'] as List<dynamic>).map((e) => CartModel.fromJson(e as Map<String, dynamic>)).toList(),
        status: HistoryStatus.values.firstWhere((element) => element.json == json['status'] as String));
    return historyModel;
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'subTotal': subTotal,
      'userId': userId,
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
