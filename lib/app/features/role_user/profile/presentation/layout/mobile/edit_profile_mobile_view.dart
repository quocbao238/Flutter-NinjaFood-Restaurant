import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/profile/presentation/layout/mobile/widgets/circle_avatar.dart';
import 'package:ninjafood/app/global_controller/global_controller.dart';

class EditProfileMobileScreen extends GetView<UserController> {
  const EditProfileMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = controller.getCurrentUser;
    if (currentUser == null) return SizedBox();
    final nullValue = TextEditingController.fromValue(TextEditingValue.empty);
    return AppScaffoldBackgroundImage.pattern(
      appBarWidget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppButtonBack(onPressed: () => Get.back()),
          Expanded(
            child: AppPadding(
              padding: const AppEdgeInsets.only(
                  top: AppGapSize.paddingMedium,
                  right: AppGapSize.paddingMedium,
                  bottom: AppGapSize.regular),
              child: AppText.headlineSmall(
                text: 'Edit Profile',
                fontWeight: FontWeight.bold,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          SizedBox(
            width: 45,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: AppPadding(
          padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatarWithEditButton(
                  imageUrl: currentUser.photoUrl ?? '',
                  onEditPressed: () {},
                ),
              ),
              AppPadding(
                  padding: AppEdgeInsets.symmetric(vertical: AppGapSize.medium),
                  child: AppText.bodyLarge(
                    text: currentUser.email ?? '',
                  )),
              AppTextFormField(
                hintText: 'First Name',
                controller: nullValue,
              ),
              AppPadding(
                  padding: AppEdgeInsets.symmetric(vertical: AppGapSize.medium),
                  child: AppTextFormField(
                    hintText: 'Last Name',
                    controller: nullValue,
                  )),
              AppTextFormField.phone(
                hintText: 'Phone Number',
                controller: nullValue,
              ),
              AppPadding(
                  padding: AppEdgeInsets.symmetric(vertical: AppGapSize.medium),
                  child: AppTextFormField(
                    hintText: 'Address',
                    controller: nullValue,
                  )),
              Center(
                  child: AppButton.max(
                title: 'Save Changes',
                onPressed: () {},
              ))
            ],
          ),
        ),
      ),
    );
  }
}


// Email - hiển thị không cho thay đổi
// First Name
// LastName
// PhoneNumber
// Address