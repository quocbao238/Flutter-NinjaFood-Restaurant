import 'dart:async';
import 'package:get/get.dart';
import 'package:ninjafood/app/constants/contains.dart';
import 'package:ninjafood/app/models/user_model.dart';
import 'package:ninjafood/app/services/boot_service/boot_services.dart';
import 'package:ninjafood/app/services/database_service/database_service.dart';

const _logName = 'RestaurantController';

final class RestaurantController extends GetxController implements Bootable {
  static RestaurantController get instance => Get.find<RestaurantController>();
  late final DatabaseService _databaseService;

  final restaurantProfile = Rx<UserModel?>(null);

  @override
  Future<void> call() async {
    Get.put(this, permanent: true);
    _databaseService = DatabaseService.instance;
    _handleRestaurantProfile();
  }

  void _handleRestaurantProfile() async =>
      await _databaseService.getAdminUser().then((response) => response.fold(
          (l) => handleFailure(_logName, l),
          (r) => restaurantProfile.value = r));

  @override
  void dispose() => super.dispose();
}
