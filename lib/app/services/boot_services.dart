import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

abstract class BootableService {
  int get priority;

  Future<void> call();
}

class BootServices {
  Future<void> boot(List<Tuple2<BootableService, int>> listBootService) async {
    listBootService.sort((a, b) => b.item2.compareTo(a.item2));
    for (final controller in listBootService)
      controller.item1.call();
    print('Boot services completed');
  }
}
