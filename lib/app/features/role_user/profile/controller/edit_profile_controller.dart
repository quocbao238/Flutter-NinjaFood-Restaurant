import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/constants/contains.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/global_controller/global_controller.dart';
import 'package:ninjafood/app/helper/helper.dart';
import 'package:ninjafood/app/models/user_model.dart';
import 'package:ninjafood/app/services/cloud_storage_service/cloud_storage_service.dart';

const _logName = 'EditProfileController';

class EditProfileController extends BaseController {
  final userController = UserController.instance; //
  final storageService = CloudStorageService.instance; //

  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController phoneController;
  late final TextEditingController addressController;
  late final TextEditingController emailController;

  Rxn<String?> firstNameError = Rxn<String?>(null);
  Rxn<String?> lastNameError = Rxn<String?>(null);
  Rxn<String?> phoneError = Rxn<String?>(null);
  Rxn<String?> addressError = Rxn<String?>(null);
  Rx<UserModel?> currentUser = Rx<UserModel?>(null);
  Rx<File?> imageFile = Rx<File?>(null);

  @override
  void onInit() {
    currentUser.value = userController.getCurrentUser;
    firstNameController = TextEditingController(text: currentUser.value?.firstName ?? '');
    lastNameController = TextEditingController(text: currentUser.value?.lastName ?? '');
    phoneController = TextEditingController(text: currentUser.value?.phoneNumber ?? '');
    addressController = TextEditingController(text: currentUser.value?.address ?? '');
    emailController = TextEditingController(text: currentUser.value?.email ?? '');

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

    addressController.addListener(() {
      final address = addressController.text;
      addressError.value = Validator.validateAddress(address);
    });

    super.onInit();
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    addressController.dispose();

    super.onClose();
  }

  Future<void> updateUser() async {
    if (firstNameError.value != null ||
        lastNameError.value != null ||
        phoneError.value != null ||
        addressError.value != null) {
      return;
    }
    loading(true);

    final resultUrl = imageFile.value != null
        ? await storageService.uploadAvatarImage(file: imageFile.value!, uid: currentUser.value!.uid)
        : null;
    final response = await userController.updateUser(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      phoneNumber: phoneController.text,
      address: addressController.text,
      photoUrl: resultUrl,
    );
    await response.fold((l) => handleFailure(_logName, l), (r) {});
    loading(false);
  }

  void onPickerImage() async {
    final image = await FileHelper.pickImage();
    if (image != null) imageFile.value = image;
  }
}
