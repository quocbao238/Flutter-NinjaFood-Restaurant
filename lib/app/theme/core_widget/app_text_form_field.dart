part of core_widget;

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight,
      child: AppPadding(
        padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.regular),
        child: TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
    );
  }
}
