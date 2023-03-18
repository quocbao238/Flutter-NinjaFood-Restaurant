part of core_widget;

class AppErrorWidget extends StatelessWidget {
  final String? message;
  const AppErrorWidget({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(message ?? 'Error Widget'));
  }
}
