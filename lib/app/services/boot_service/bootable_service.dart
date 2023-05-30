part of 'boot_services.dart';

abstract class Bootable {
  Future<void> call();
}
