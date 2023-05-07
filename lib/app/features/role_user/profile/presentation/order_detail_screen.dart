import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/profile/presentation/layout/mobile/order_detail_view/order_detail_view.dart';
import 'package:ninjafood/app/models/history_model.dart';

class OrderDetailsScreen extends StatelessWidget {
  final OrderModel orderModel;

  const OrderDetailsScreen({Key? key, required this.orderModel}) : super(key: key);

  @override
  Widget build(BuildContext context) => AppViewLayout(mobileView: OrderDetailsMobileView(orderModel: orderModel));
}
