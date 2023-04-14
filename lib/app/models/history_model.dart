import 'package:ninjafood/app/models/cart_model.dart';
import 'package:ninjafood/app/models/comment_model.dart';

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
  CommentModel? comment;

  HistoryOrderModel(
      {required this.uid,
      required this.subTotal,
      required this.serviceFee,
      required this.total,
      required this.discount,
      required this.createdAt,
      required this.carts,
      this.comment,
      required this.status});

  factory HistoryOrderModel.fromJson(Map<String, dynamic> json) {
    final historyModel = HistoryOrderModel(
        uid: json['uid'] as String,
        createdAt: json['createdAt'] as String,
        subTotal: double.parse(json['subTotal'].toString()),
        serviceFee: double.parse(json['serviceFee'].toString()),
        discount: double.parse(json['discount'].toString()),
        total: double.parse(json['total'].toString()),
        comment: json['comment'] != null ? CommentModel.fromJson(json['comment'] as Map<String, dynamic>) : null,
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
      'comment': comment?.toJson(),
      'status': status.json
    };
  }

  void updateStatus(HistoryStatus status) {
    this.status = status;
  }

  void updateComment(CommentModel comment) {
    this.comment = comment;
  }




}
