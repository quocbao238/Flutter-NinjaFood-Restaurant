part of core_widget;

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325,
      height: kToolbarHeight,
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)
          ),
        ),
      ),
    );
  }
}
