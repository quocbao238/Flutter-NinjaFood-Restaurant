part of 'edit_profile_mobile_view.dart';

class TextInputTitle extends StatelessWidget {
  final String title;
  final AppGapSize paddingLeft;
  final AppGapSize paddingRight;
  final AppGapSize paddingTop;
  final AppGapSize paddingBottom;

  const TextInputTitle(
      {Key? key,
      required this.title,
      this.paddingLeft = AppGapSize.small,
      this.paddingRight = AppGapSize.small,
      this.paddingTop = AppGapSize.regular,
      this.paddingBottom = AppGapSize.small})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppPadding(
      padding: AppEdgeInsets.only(top: paddingTop, bottom: paddingBottom, left: paddingLeft, right: paddingRight),
      child: AppText.bodyMedium(
          text: title, textAlign: TextAlign.start, fontWeight: FontWeight.bold, color: ThemeColors.primaryColor),
    );
  }
}
