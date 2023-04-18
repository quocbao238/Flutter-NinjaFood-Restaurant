part of 'edit_profile_mobile_view.dart';


class TextInputTitle extends StatelessWidget {
  final String title;

  const TextInputTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppPadding(
      padding: AppEdgeInsets.only(
          top: AppGapSize.regular, bottom: AppGapSize.small, left: AppGapSize.small, right: AppGapSize.small),
      child: AppText.bodyMedium(
        text: title,
        textAlign: TextAlign.start,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.6)
      ),
    );
  }
}
