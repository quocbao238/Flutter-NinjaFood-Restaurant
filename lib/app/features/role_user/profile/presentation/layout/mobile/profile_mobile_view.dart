import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/profile/controller/profile_controller.dart';
import 'package:ninjafood/app/features/role_user/profile/infrastructure/models/profile_model.dart';
import 'package:ninjafood/app/features/role_user/profile/presentation/layout/mobile/widgets/profile_appbar.dart';
import 'package:ninjafood/app/features/role_user/profile/presentation/layout/mobile/widgets/profile_person.dart';
import 'package:ninjafood/app/features/role_user/tabs/controllers/tabs_controller.dart';

class ProfileMobileView extends GetView<ProfileController> {
  const ProfileMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final List<FavoriteFood> favoriteItem = FavoriteFood.favoriteItem;
    final tapController = Get.find<TabsController>();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: MySliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height * 0.4,
              minExtentHeight: MediaQuery.of(context).size.height * 0.2,
              backgroundImage: AssetImage(
                  'assets/icons/photo_profile.png'), // set the image as the background
              title:
                  AppButtonDrawer(onPressed: () => tapController.toggleDrawer()),
            ),
          ),
          ProfilePerson(isDarkMode: isDarkMode, favoriteItem: favoriteItem),
        ],
      ),
    );
  }
}
