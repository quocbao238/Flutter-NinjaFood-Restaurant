import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/home/presentation/layout/mobile/promotion_detail_view.dart';
import 'package:ninjafood/app/models/promotion_model.dart';

class PromotionDetailScreen extends StatelessWidget {
  final PromotionModel promotionModel;

  const PromotionDetailScreen({Key? key, required this.promotionModel}) : super(key: key);

  @override
  Widget build(BuildContext context) => AppViewLayout(mobileView: PromotionMobileView(promotionModel: promotionModel));
}
