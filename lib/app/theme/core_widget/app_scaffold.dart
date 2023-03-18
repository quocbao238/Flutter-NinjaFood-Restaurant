part of core_widget;

class AppScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? floatActionButton;
  const AppScaffold(
      {super.key, this.appBar, required this.body, this.floatActionButton});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(child: body),
      floatingActionButton: floatActionButton,
    );
  }
}
