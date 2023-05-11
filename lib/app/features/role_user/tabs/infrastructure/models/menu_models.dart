import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ninjafood/app/features/role_admin/home/presentation/admin_home_screen.dart';
import 'package:ninjafood/app/features/role_admin/orders/presentation/admin_order_screen.dart';
import 'package:ninjafood/app/features/role_admin/rating/presentation/admin_rating_screen.dart';
import 'package:ninjafood/app/features/role_user/cart/presentation/cart_screen.dart';
import 'package:ninjafood/app/features/role_user/chat_message/presentation/group_chat_screen.dart';
import 'package:ninjafood/app/features/role_user/home/presentation/home_screen.dart';
import 'package:ninjafood/app/features/role_user/notification/presentation/notification_screen.dart';
import 'package:ninjafood/app/features/role_user/profile/presentation/profile_screen.dart';

enum MenuType {
  home,
  chat,
  profile,
  cart,
  language,
  logout,
  about,
  changeTheme,
  notification,
  order,
  rating;
}

class MenuItem {
  final String title;
  final IconData iconData;
  final Widget? screen;
  final MenuType menuType;
  final int index;

  MenuItem({
    required this.title,
    required this.iconData,
    this.screen,
    required this.menuType,
    required this.index,
  });

  static List<MenuItem> listAdminMenu = [
    MenuItem(
        index: 0,
        title: 'Drawer_Home',
        iconData: FontAwesomeIcons.house,
        screen: AdminHomeScreen(),
        menuType: MenuType.home),
    MenuItem(
        index: 1,
        title: 'Order',
        iconData: FontAwesomeIcons.jediOrder,
        screen: AdminOrderScreen(),
        menuType: MenuType.order),
    MenuItem(
        index: 2,
        title: 'Notification_Title',
        iconData: FontAwesomeIcons.bell,
        screen: NotificationScreen(),
        menuType: MenuType.notification),
    MenuItem(
        index: 3,
        title: 'Drawer_Chat',
        iconData: FontAwesomeIcons.message,
        screen: GroupChatScreen(),
        menuType: MenuType.chat),
    MenuItem(
        index: 4,
        title: 'Drawer_Profile',
        iconData: FontAwesomeIcons.user,
        screen: ProfileScreen(),
        menuType: MenuType.profile),
    MenuItem(
        index: 5,
        title: 'Rating_Rate',
        iconData: FontAwesomeIcons.user,
        screen: AdminRatingScreen(),
        menuType: MenuType.rating),
    MenuItem(
        index: 6,
        title: 'Drawer_Language_Change',
        iconData: FontAwesomeIcons.gear,
        screen: null,
        menuType: MenuType.language),
    MenuItem(
        index: 7,
        title: 'Drawer_Theme_Change',
        iconData: FontAwesomeIcons.themeisle,
        screen: null,
        menuType: MenuType.changeTheme),
    MenuItem(
        index: 8,
        title: 'Drawer_Logout',
        iconData: FontAwesomeIcons.rightFromBracket,
        screen: null,
        menuType: MenuType.logout),
  ];

  static List<MenuItem> listMenu = [
    MenuItem(
        index: 0,
        title: 'Drawer_Home',
        iconData: FontAwesomeIcons.house,
        screen: HomeScreen(),
        menuType: MenuType.home),
    MenuItem(
        index: 1,
        title: 'Drawer_Profile',
        iconData: FontAwesomeIcons.user,
        screen: ProfileScreen(),
        menuType: MenuType.profile),
    MenuItem(
        index: 2,
        title: 'Drawer_Cart',
        iconData: FontAwesomeIcons.cartShopping,
        screen: CartScreen(),
        menuType: MenuType.cart),
    MenuItem(
        index: 3,
        title: 'Drawer_Chat',
        iconData: FontAwesomeIcons.message,
        screen: GroupChatScreen(),
        menuType: MenuType.chat),
    MenuItem(
        index: 4,
        title: 'Drawer_Language_Change',
        iconData: FontAwesomeIcons.gear,
        screen: null,
        menuType: MenuType.language),
    MenuItem(
        index: 5,
        title: 'Drawer_Theme_Change',
        iconData: FontAwesomeIcons.themeisle,
        screen: null,
        menuType: MenuType.changeTheme),
    MenuItem(
        index: 6,
        title: 'Drawer_About',
        iconData: FontAwesomeIcons.info,
        screen: null,
        menuType: MenuType.about),
    MenuItem(
        index: 7,
        title: 'Drawer_Logout',
        iconData: FontAwesomeIcons.rightFromBracket,
        screen: null,
        menuType: MenuType.logout),
  ];
}
