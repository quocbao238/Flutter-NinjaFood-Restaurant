import 'package:ninjafood/app/services/services.dart';
import 'package:tuple/tuple.dart';

abstract class BootableService {
  Future<void> call();
}

class BootServices {
  Future<void> boot(List<Tuple2<BootableService, int>> listBootService) async {
    listBootService.sort((a, b) => b.item2.compareTo(a.item2));
    for (final controller in listBootService) controller.item1();
    print('Boot services completed');
  }
}

Future bootAppServices() async {
  await BootServices().boot(listBootServices);
}
