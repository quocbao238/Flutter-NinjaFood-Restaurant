import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/global_controller/global_controller.dart';
import 'package:ninjafood/app/helper/helper.dart';
import 'package:ninjafood/app/routes/routes.dart';

class SignUpProcessController extends BaseController {
  final AuthController authController;

  SignUpProcessController({required this.authController});

  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController phoneController;
  Rxn<String?> firstNameError = Rxn<String?>(null);
  Rxn<String?> lastNameError = Rxn<String?>(null);
  Rxn<String?> phoneError = Rxn<String?>(null);

  @override
  void onInit() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    phoneController = TextEditingController();

    firstNameController.addListener(() {
      final firstName = firstNameController.text;
      firstNameError.value = Validator.validateName(firstName);
    });

    lastNameController.addListener(() {
      final lastName = lastNameController.text;
      lastNameError.value = Validator.validateName(lastName);
    });

    phoneController.addListener(() {
      final phone = phoneController.text;
      phoneError.value = Validator.validatePhone(phone);
    });

    super.onInit();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void onPressBack() {
    Get.back();
  }

  Future<void> onPressedNext() async {
    if (firstNameError.value != null || lastNameError.value != null || phoneError.value != null) {
      return;
    }

    loading(true);
    await authController
        .updateUserFirestore(
            firstName: firstNameController.text, lastName: lastNameController.text, phoneNumber: phoneController.text)
        .then((value) {
      if (value) Get.toNamed(AppRouteProvider.paymentMethodScreen);
    });
    loading(false);
  }
}
