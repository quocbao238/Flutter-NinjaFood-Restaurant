import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/controllers/controllers.dart';

class RoleWrapper extends GetView<UserController> {
  final Widget? adminView;
  final Widget? userView;

  RoleWrapper({this.adminView, this.userView});

  @override
  Widget build(BuildContext context) {
    // if (controller.currentUser?.value == null) {
    //   return AppLoading(isLoading: true);
    // }
    // final isAdmin = controller.currentUser?.value?.isAdmin() ?? false;
    // return isAdmin ? adminView ?? SizedBox() : userView ?? SizedBox();

    return Obx(
      () {
        final currentUser = controller.currentUser?.value;
        return Builder(
          builder: (context) {
            if (currentUser == null) {
              return AppLoading(isLoading: true);
            }
            final isAdmin = currentUser.isAdmin();
            return isAdmin ? adminView ?? SizedBox() : userView ?? SizedBox();
          },
        );
      },
    );
  }
}
