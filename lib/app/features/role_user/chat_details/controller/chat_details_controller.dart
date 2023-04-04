import 'package:get/get.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/features/role_user/chat/infrastructure/models/chat_model.dart';
import 'package:ninjafood/app/features/role_user/tabs/controllers/tabs_controller.dart';

class ChatDetailsController extends BaseController {
  final TabsController tabsController;

  ChatDetailsController({required this.tabsController});
  late ChatModel chatModel;

  @override
  void onInit() {
    chatModel = Get.arguments as ChatModel;
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onPressedback() {
    Get.back();
  }
}
