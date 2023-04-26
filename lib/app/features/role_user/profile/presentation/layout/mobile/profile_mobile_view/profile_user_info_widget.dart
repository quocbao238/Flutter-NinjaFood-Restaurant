part of 'profile_mobile_view.dart';

class ProfileUserInformationWidget extends GetView<UserController> {
  const ProfileUserInformationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileController = Get.find<ProfileController>();
    final currentUser = controller.getCurrentUser;
    if (currentUser == null) return SizedBox();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18), color: ThemeColors.textPriceColor.withOpacity(0.1)),
          child: AppPadding.small(
            child: AppText.bodyMedium(
              text: currentUser.userType?.name.tr ?? '',
              fontWeight: FontWeight.w400,
              color: ThemeColors.textPriceColor,
            ),
          ),
        ),
        AppPadding(
          padding: AppEdgeInsets.symmetric(vertical: AppGapSize.medium),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText.headlineMedium(text: currentUser.getName(), fontWeight: FontWeight.bold),
              IconButton(
                onPressed: profileController.onPressEditProfile,
                icon: Icon(
                  FontAwesomeIcons.penToSquare,
                  color: ThemeColors.primaryColor,
                ),
              )
            ],
          ),
        ),
        AppText.bodyMedium(text: currentUser.email ?? '', fontWeight: FontWeight.w400),
      ],
    );
  }
}
