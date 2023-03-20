part of core_widget;

class AppLoading extends StatelessWidget {
  final bool isLoading;
  const AppLoading({super.key, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    if (!isLoading) return SizedBox.shrink();
    return Center(
      child: SpinKitFadingCircle(
        itemBuilder: (BuildContext context, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(color: ThemeColors.primaryColor),
          );
        },
      ),
    );
  }
}
