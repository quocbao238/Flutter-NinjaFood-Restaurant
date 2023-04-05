import 'package:get/get.dart';
import 'package:ninjafood/app/services/services.dart';

class BootService {
  final int priority;
  final ServiceImpl serviceImpl;

  BootService({required this.priority,required this.serviceImpl, });
}

Future<void> runBootServices(List<BootService> boots) async {
  boots.sort((a, b) => a.priority.compareTo(b.priority));
  await Future.forEach(boots, (BootService boot) async {
    final service = boot.serviceImpl;
    await Get.put(service)();
  });
}


