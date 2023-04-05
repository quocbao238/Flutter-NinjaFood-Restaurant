class BootService {
  final int priority;
  final ServiceImpl serviceImpl;

  BootService({required this.priority,required this.serviceImpl, });
}

abstract class ServiceImpl {
  Future<void> call();
}

Future<void> runBootServices(List<BootService> boots) async {
  boots.sort((a, b) => a.priority.compareTo(b.priority));
  await Future.forEach(boots, (BootService boot) async {
    await boot.serviceImpl();
  });
}


