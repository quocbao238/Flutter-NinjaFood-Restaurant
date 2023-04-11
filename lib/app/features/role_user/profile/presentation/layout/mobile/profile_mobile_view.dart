import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/profile/presentation/layout/mobile/widgets/profile_appbar.dart';
import 'package:ninjafood/app/features/role_user/profile/presentation/layout/mobile/widgets/profile_person.dart';
import 'package:ninjafood/app/features/role_user/tabs/controllers/tabs_controller.dart';
import 'package:ninjafood/app/global_controller/global_controller.dart';

class ProfileMobileView extends GetView<UserController> {
  const ProfileMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    final tapController = Get.find<TabsController>();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: Obx(() {
        final currentUser = controller.getCurrentUser;
        if (currentUser == null) return Container();
        return CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: MySliverAppBar(
                expandedHeight: MediaQuery.of(context).size.height * 0.4,
                minExtentHeight: MediaQuery.of(context).size.height * 0.2,
                backgroundImage: CachedNetworkImage(imageUrl: currentUser.photoUrl ?? '', fit: BoxFit.cover),
                title: AppButtonDrawer(onPressed: () => tapController.toggleDrawer()),
              ),
            ),
            ProfilePerson(),
          ],
        );
      }),
    );
  }
}
