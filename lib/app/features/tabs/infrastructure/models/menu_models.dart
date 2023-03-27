import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ninjafood/app/features/cart/presentation/cart_screen.dart';
import 'package:ninjafood/app/features/chat/presentation/chat_screen.dart';
import 'package:ninjafood/app/features/home/presentation/home_screen.dart';
import 'package:ninjafood/app/features/profile/presentation/profile_screen.dart';

enum MenuType {
  home,
  chat,
  profile,
  cart,
  settings,
  logout,
  about,
  changeTheme,
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

  static List<MenuItem> listMenu = [
    MenuItem(index: 0, title: 'Home', iconData: FontAwesomeIcons.house, screen: HomeScreen(), menuType: MenuType.home),
    MenuItem(
        index: 1,
        title: 'Profile',
        iconData: FontAwesomeIcons.user,
        screen: ProfileScreen(),
        menuType: MenuType.profile),
    MenuItem(
        index: 2,
        title: 'Cart',
        iconData: FontAwesomeIcons.cartShopping,
        screen: CartScreen(),
        menuType: MenuType.cart),
    MenuItem(
        index: 3, title: 'Chat', iconData: FontAwesomeIcons.message, screen: ChatScreen(), menuType: MenuType.chat),
    MenuItem(index: 4, title: 'Settings', iconData: FontAwesomeIcons.gear, screen: null, menuType: MenuType.settings),
    MenuItem(
        index: 5,
        title: 'Change Theme',
        iconData: FontAwesomeIcons.themeisle,
        screen: null,
        menuType: MenuType.changeTheme),
    MenuItem(index: 6, title: 'About', iconData: FontAwesomeIcons.info, screen: null, menuType: MenuType.about),
    MenuItem(
        index: 7,
        title: 'Logout',
        iconData: FontAwesomeIcons.rightFromBracket,
        screen: null,
        menuType: MenuType.logout),
  ];
}
