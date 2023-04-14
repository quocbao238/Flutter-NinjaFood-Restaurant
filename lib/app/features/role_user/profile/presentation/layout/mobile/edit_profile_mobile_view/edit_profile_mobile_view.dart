library edit_profile_mobile_view;

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/profile/controller/edit_profile_controller.dart';

part 'edit_profile_avatar.dart';

part 'edit_profile_input_title.dart';

part 'edit_profile_app_bar.dart';

class EditProfileMobileScreen extends GetView<EditProfileController> {
  const EditProfileMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage.pattern(
      appBarWidget: EditProfileAppBarWidget(),
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
                      TextInputTitle(title: 'First Name'),
                      AppTextFormField(
                          hintText: 'First Name',
                          textStyle: textStyle,
                          decoration: decoration(controller.firstNameError.value, context),
                          controller: controller.firstNameController),
                      TextInputTitle(title: 'Last Name'),
                      AppTextFormField(
                          hintText: 'Last Name',
                          textStyle: textStyle,
                          decoration: decoration(controller.lastNameError.value, context),
                          controller: controller.lastNameController),
                      TextInputTitle(title: 'Email'),
                      AppTextFormField(
                          hintText: 'Email',
                          enabled: false,
                          textStyle: textStyle,
                          decoration: decoration(null, context),
                          controller: controller.emailController),
                      TextInputTitle(title: 'Phone Number'),
                      AppTextFormField.phone(
                          hintText: 'Phone Number',
                          textStyle: textStyle,
                          decoration: decoration(controller.phoneError.value, context),
                          controller: controller.phoneController),
                      TextInputTitle(title: 'Address'),
                      AppTextFormField(
                          hintText: 'Address',
                          textStyle: textStyle,
                          decoration: decoration(controller.addressError.value, context),
                          controller: controller.addressController),
                      SizedBox(height: AppGapSize.medium.size),
                    ],
                  ),
                ),
              ),
              AppPadding(
                padding: AppEdgeInsets.symmetric(vertical: AppGapSize.medium),
                child: AnimationButton(
                  textButton: 'Save Changes',
                  onDone: () => Get.back(),
                  loading: controller.loading.value,
                  onPressed: () => controller.updateUser(),
                  textDone: 'Done',
                  textLoading: 'Loading...',
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
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.onBackground.withOpacity(0.6),
          width: 2.0,
        ),
      ),
      border: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          color: ThemeColors.primaryColor,
          width: 2.0,
        ),
      ),
      errorBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: ThemeColors.textRedColor, width: 3.0),
      ),
    );
