// import 'package:get/get.dart';
// import 'package:ninjafood/app/constants/contains.dart';
// import 'package:ninjafood/app/core/core.dart';
// import 'package:ninjafood/app/controllers/controllers.dart';
// import 'package:ninjafood/app/models/history_model.dart';
// import 'package:ninjafood/app/models/product_model.dart';
// import 'package:ninjafood/app/routes/routes.dart';
// import 'package:ninjafood/app/services/database_service/database_service.dart';
//
// const _logName = 'ProfileController';
//
// class ProfileController extends BaseController {
//   static ProfileController get instance => Get.find();
//   final DatabaseService databaseService = DatabaseService.instance;
//   final UserController userController = UserController.instance;
//   final lstHistory = <OrderModel>[].obs;
//
//   @override
//   void onInit() {
//     _getListOrderHistory();
//     userController.currentUser.listen((event) {
//       if (event == null) return;
//       _getListOrderHistory();
//     });
//
//     super.onInit();
//   }
//
//   @override
//   void onClose() {
//     super.onClose();
//   }
//
//   Future<void> _getListOrderHistory() async {
//     final lstOrderId = userController.currentUser.value?.orderIds ?? [];
//     if (lstOrderId.isEmpty) {
//       loading.value = false;
//       return;
//     }
//
//     final response = await databaseService.getListOrdersByListId(lstOrderId);
//     response.fold((l) => handleFailure(_logName, l, showDialog: true), (r) {
//       lstHistory.assignAll(r);
//     });
//     loading.value = false;
//   }
//
// }
