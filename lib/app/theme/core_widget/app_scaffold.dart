part of core_widget;

class AppScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final bool isLoading;
  final Widget body;
  final Widget? floatActionButton;
  const AppScaffold(
      {super.key,
      this.appBar,
      required this.body,
      this.floatActionButton,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Stack(
        alignment: Alignment.center,
        children: [SafeArea(child: body), AppLoading(isLoading: isLoading)],
      ),
      floatingActionButton: floatActionButton,
    );
  }
}
