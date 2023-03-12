part of 'base_widget.dart';

class BaseErrorWidget extends StatelessWidget {
  final String? message;
  const BaseErrorWidget({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(message ?? 'Error Widget'));
  }
}
