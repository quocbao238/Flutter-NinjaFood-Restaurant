part of core_widget;

class AppButtonBack extends StatelessWidget {
  final VoidCallback? onPressed;
  const AppButtonBack({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    if (onPressed == null) return SizedBox.shrink();

    return Padding(
      padding: EdgeInsets.only(
          top: ThemeSizes.verylarge,
          left: ThemeSizes.regular,
          bottom: ThemeSizes.regular),
      child: SizedBox(
        width: 45,
        height: 45,
        child: ElevatedButton(
          onPressed: () => onPressed?.call(),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFF9A84D).withOpacity(0.1),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)),
          ),
          child: Center(child: AppIcons.back()),
        ),
      ),
    );
  }
}
