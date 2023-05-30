import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/constants/contains.dart';
import 'package:ninjafood/app/controllers/controllers.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/models/history_model.dart';

class RatingScreenController extends BaseController {
  final UserController userController = UserController.instance;
  final rating = 5.0.obs;
  final enableSubmit = false.obs;
  final TextEditingController commentController = TextEditingController();
  late final OrderModel orderModel;

  @override
  void onInit() {
    orderModel = Get.arguments as OrderModel;
    commentController.addListener(() {
      if (commentController.text.isNotEmpty) {
        enableSubmit.value = true;
        return;
      }
      enableSubmit.value = false;
    });
    super.onInit();
  }

  @override
  void onClose() {
    commentController.dispose();
    super.onClose();
  }

  void onPressedSkip() => Get.back();

  void onRatingUpdate(double rating) => this.rating.value = rating;

  Future<void> onPressedSubmit() async {
    if (!enableSubmit.value) return;
    if (commentController.text.isEmpty) return;
    if (rating.value == 0) return;
    loading(true);
    final response = await userController.insertComment(
        comment: commentController.text,
        rating: rating.value,
        orderModel: orderModel);
    response.fold(
        (l) => handleFailure("RatingScreenController.onPressedSubmit", l,
            showDialog: true),
        (r) => {
              Get.back(result: true),
              Get.snackbar(
                'Rating_Rate_Success'.tr,
                'Rating_Rate_Success_Description'.tr,
                snackPosition: SnackPosition.TOP,
              )
            });
    loading(false);
  }
}
