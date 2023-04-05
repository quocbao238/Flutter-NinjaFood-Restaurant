import 'package:get/get.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/models/chat_model.dart';
import 'package:ninjafood/app/features/role_user/tabs/controllers/tabs_controller.dart';
import 'package:ninjafood/app/global_controller/global_controller.dart';

class ChatDetailsController extends BaseController {
  final TabsController tabsController;
  final AuthController authController;

  ChatDetailsController({required this.tabsController, required this.authController});

  Rx<ChatModel> chatModel = Rx<ChatModel>(Get.arguments as ChatModel);

  @override
  void onInit() {
    authController.chatList.listen((p0) {
      if (p0.isNotEmpty) chatModel.value = p0[0];
    });
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onPressedBack() {
    Get.back();
  }
}
