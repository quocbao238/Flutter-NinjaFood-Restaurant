


import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/features/role_user/chat/infrastructure/models/chat_model.dart';
import '../../tabs/controllers/tabs_controller.dart';

class ChatScreenController extends BaseController{
  final TabsController tabsController;
  ChatScreenController({required this.tabsController});



  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onTapChat(ChatModel chatModel){
  }
}