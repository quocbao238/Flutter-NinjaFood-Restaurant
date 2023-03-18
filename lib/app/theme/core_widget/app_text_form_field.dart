part of core_widget;

class AppTextFormField extends StatelessWidget {
  final Widget? prefixIcon;
  final bool obscureText;
  final String hintText;
  const AppTextFormField({
    super.key,
    this.prefixIcon,
    required this.obscureText,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight,
      width: MediaQuery.of(context).size.width * 0.85,
      child: TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
          isDense: true,
          hintText: hintText,
          prefixIcon: AppPadding.medium(child: prefixIcon),
        ),
      ),
    );
  }
}
