library profile_mobile_view;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/controllers/controllers.dart';
import 'package:ninjafood/app/features/role_user/category/presentation/layout/mobile/product_detail_view/product_detail_mobile_view.dart';
import 'package:ninjafood/app/features/role_user/home/controllers/home_controller.dart';
import 'package:ninjafood/app/features/role_user/profile/controller/profile_controller.dart';
import 'package:ninjafood/app/features/role_user/tabs/controllers/tabs_controller.dart';
import 'package:ninjafood/app/helper/helper.dart';
import 'package:ninjafood/app/features/role_user/category/presentation/layout/mobile/product_detail_view/widgets/product_favorite_item.dart';
import 'package:ninjafood/app/routes/routes.dart';
import 'package:ninjafood/app/widgets/widgets.dart';

part 'profile_appbar.dart';
part 'profile_body.dart';
part 'profile_favorite_list_widget.dart';
part 'profile_history_list_widget.dart';
part 'profile_user_info_widget.dart';
part 'profile_voucher_widget.dart';

class ProfileMobileView extends GetView<UserController> {
  const ProfileMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    final tapController = Get.find<TabsController>();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: Obx(() {
        final currentUser = controller.currentUser.value;
        if (currentUser == null) return Container();
        return CustomScrollView(
          slivers: [
            SliverPersistentHeader(
                pinned: true,
                delegate: ProfileAppBar(
                    expandedHeight: MediaQuery.of(context).size.height * 0.4,
                    minExtentHeight: MediaQuery.of(context).size.height * 0.2,
                    backgroundImage: CachedNetworkImage(imageUrl: currentUser.photoUrl ?? '', fit: BoxFit.cover),
                    // set the image as the background
                    title: AppButtonDrawer(onPressed: () => tapController.toggleDrawer()))),
            ProfileBody(),
          ],
        );
      }),
    );
  }
}
