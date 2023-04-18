part of 'edit_profile_mobile_view.dart';

class EditProfileAppBarWidget extends StatelessWidget {
  const EditProfileAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppButtonBack(onPressed: () => Get.back()),
        Expanded(
            child: AppPadding(
                padding: const AppEdgeInsets.only(
                    top: AppGapSize.paddingMedium, right: AppGapSize.paddingMedium, bottom: AppGapSize.regular),
                child: AppText.headlineSmall(
                    text: 'Edit Profile', fontWeight: FontWeight.bold, maxLines: 1, overflow: TextOverflow.ellipsis))),
        SizedBox(width: 45)
      ],
    );
  }
}
