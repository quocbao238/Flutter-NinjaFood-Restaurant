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
    return Container(
      height: kToolbarHeight,
      width: MediaQuery.of(context).size.width * 0.85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0xFFF4F4F4),
            spreadRadius: 5,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
          isDense: true,
          hintText: hintText,
          hintStyle: ThemeText.bodyMedium.copyWith(color: Color(0xff3B3B3B)),
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
      // child: AppPadding(
      //   padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.regular),
      //   child: TextFormField(
      //     obscureText: obscureText,
      //     decoration: InputDecoration(
      //       isDense: true,
      //       hintText: hintText,
      //       hintStyle: ThemeText.bodyMedium.copyWith(color: Color(0xff3B3B3B)),
      //       prefixIcon: prefixIcon,
      //       border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      //     ),
      //   ),
      // ),
    );
  }
}
