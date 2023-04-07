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
        SliverPersistentHeader(
          pinned: true,
          delegate: MySliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.4,
            minExtentHeight: MediaQuery.of(context).size.height * 0.2,
            backgroundImage: AssetImage(
                'assets/icons/photo_profile.png'), // set the image as the background
            title: AppButtonDrawer(onPressed: () {}),
          ),
        ),
        ProfilePerson(isDarkMode: isDarkMode, favoriteItem: favoriteItem),
      ],
    );
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final double minExtentHeight;
  final Widget title;
  final ImageProvider backgroundImage;

  MySliverAppBar({
    required this.minExtentHeight,
    required this.expandedHeight,
    required this.title,
    required this.backgroundImage,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image(
          image: backgroundImage,
          fit: BoxFit.cover,
        ),
        Container(
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.7),
              ],
            ),
          ),
        ),
        Positioned(
          top: 16,
          left: 16,
          child: title, // add the title widget
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: 30,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => minExtentHeight;

  @override
  bool shouldRebuild(covariant MySliverAppBar oldDelegate) {
    return expandedHeight != oldDelegate.expandedHeight;
    title != oldDelegate.title;
    backgroundImage != oldDelegate.backgroundImage;
  }
}
