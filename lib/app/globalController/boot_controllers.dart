import 'package:tuple/tuple.dart';

abstract class BootableController {
  int get priority;
  Future<void> call();
}

class BootControllers {
  Future<void> boot(
      List<Tuple2<BootableController, int>> listBootService) async {
    listBootService.sort((a, b) => b.item2.compareTo(a.item2));
    for (final controller in listBootService) controller.item1.call();
    print('Boot controller completed');
  }
}
