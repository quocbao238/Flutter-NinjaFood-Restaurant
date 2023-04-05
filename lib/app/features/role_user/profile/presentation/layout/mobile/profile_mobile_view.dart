import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/profile/infrastructure/models/profile_model.dart';
import 'package:ninjafood/app/features/role_user/profile/presentation/layout/mobile/widgets/profile_person.dart';

class ProfileMobileView extends GetView {
  const ProfileMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final List<FavoriteFood> favoriteItem = FavoriteFood.favoriteItem;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          pinned: true,
          snap: true,
          elevation: 0,
          expandedHeight: MediaQuery.of(context).size.height * 0.4,
          flexibleSpace: AppSizeScale(
            ratioHeight: 1,
            child: FlexibleSpaceBar(
                background: Image.asset('assets/icons/photo_profile.png',
                    fit: BoxFit.cover)),
          ),
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                padding: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
              )),
        ),
        ProfilePerson(isDarkMode: isDarkMode, favoriteItem: favoriteItem),
      ],
    );
  }
}




