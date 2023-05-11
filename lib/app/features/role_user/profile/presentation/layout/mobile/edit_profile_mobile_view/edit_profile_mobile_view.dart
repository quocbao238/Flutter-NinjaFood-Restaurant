library edit_profile_mobile_view;

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/profile/controller/edit_profile_controller.dart';
import 'package:ninjafood/app/routes/routes.dart';
import 'package:ninjafood/app/widgets/custom_appbar.dart';

part 'edit_profile_avatar.dart';

part 'edit_profile_input_title.dart';

class EditProfileMobileScreen extends GetView<EditProfileController> {
  const EditProfileMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage.pattern(
      appBarWidget: CustomAppBar.back(title: 'Edit_Profile_Title'.tr),
      body: AppPadding(
        padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium),
        child: Obx(() {
          final currentUser = controller.currentUser.value;
          if (currentUser == null) return SizedBox();
          final textStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold);
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: CircleAvatarWithEditButton()),
                      TextInputTitle(title: 'Edit_Profile_FirstName'.tr),
                      AppTextFormField(
                          hintText: 'Edit_Profile_FirstName'.tr,
                          textStyle: textStyle,
                          decoration: decoration(controller.firstNameError.value, context),
                          controller: controller.firstNameController),
                      TextInputTitle(title: 'Edit_Profile_LastName'.tr),
                      AppTextFormField(
                          hintText: 'Edit_Profile_LastName'.tr,
                          textStyle: textStyle,
                          decoration: decoration(controller.lastNameError.value, context),
                          controller: controller.lastNameController),
                      TextInputTitle(title: 'Edit_Profile_Email'.tr),
                      AppTextFormField(
                          hintText: 'Edit_Profile_Email'.tr,
                          enabled: false,
                          textStyle: textStyle,
                          decoration: decoration(null, context),
                          controller: controller.emailController),
                      TextInputTitle(title: 'Edit_Profile_Phone'.tr),
                      AppTextFormField.phone(
                          hintText: 'Edit_Profile_Phone'.tr,
                          textStyle: textStyle,
                          decoration: decoration(controller.phoneError.value, context),
                          controller: controller.phoneController),
                      TextInputTitle(title: 'Edit_Profile_Address'.tr),
                      Row(
                        children: [
                          Expanded(
                            child: AppTextFormField(
                                hintText: 'Edit_Profile_Address'.tr,
                                textStyle: textStyle,
                                decoration: decoration(controller.addressError.value, context),
                                controller: controller.addressController),
                          ),
                          IconButton(
                              onPressed: () => controller.onPressedLocationPicker(),
                              icon: Icon(FontAwesomeIcons.mapLocationDot, color: ThemeColors.primaryColor))
                        ],
                      ),
                      SizedBox(height: AppGapSize.medium.size),
                    ],
                  ),
                ),
              ),
              SafeArea(
                child: AppPadding(
                  padding: AppEdgeInsets.symmetric(vertical: AppGapSize.medium),
                  child: AnimationButton(
                    ratioWidthButton: 0.95,
                    ratioWidthDone: 0.8,
                    ratioWidthLoading: 0.9,
                    textButton: 'Edit_Profile_Update'.tr,
                    onDone: () => Get.back(),
                    loading: controller.loading.value,
                    onPressed: () => controller.updateUser(),
                    textDone: 'Edit_Profile_Update_Success'.tr,
                    textLoading: 'Edit_Profile_Updating'.tr,
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}

InputDecoration decoration(String? errorText, BuildContext context) => InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
    fillColor: Colors.transparent,
    errorText: errorText,
    enabledBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: Theme.of(context).colorScheme.onBackground.withOpacity(0.6), width: 2.0)),
    border: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: ThemeColors.primaryColor, width: 2.0)),
    errorBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: ThemeColors.textRedColor, width: 3.0)));
