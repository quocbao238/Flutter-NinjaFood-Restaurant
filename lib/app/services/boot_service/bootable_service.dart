
part of 'boot_services.dart';

abstract class BootableService {
  Future<void> call();
}
