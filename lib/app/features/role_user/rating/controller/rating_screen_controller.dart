import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/constants/contains.dart';
import 'package:ninjafood/app/controllers/controllers.dart';
import 'package:ninjafood/app/core/core.dart';

class RatingScreenController extends BaseController {
  final UserController userController = UserController.instance;
  final rating = 3.5.obs;
  final enableSubmit = false.obs;
  final TextEditingController commentController = TextEditingController();
  late final String? historyId;

  @override
  void onInit() {
    historyId = Get.arguments as String;
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
    if (historyId == null) return;
    loading(true);
    final response =
        await userController.insertComment(comment: commentController.text, rating: rating.value, historyId: historyId!);
    response.fold((l) => handleFailure("RatingScreenController.onPressedSubmit", l, showDialog: true), (r) => {});
    loading(false);
  }
}
