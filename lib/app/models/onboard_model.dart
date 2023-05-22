import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';

class OnboardModel {
  final String title, description;
  final Widget image;

  OnboardModel({
    required this.image,
    required this.title,
    required this.description,
  });

  static final List<OnboardModel> lstData = [
    OnboardModel(
        image: AppImages.onboardBanner1(),
        title: 'OnboardScreen_Title1',
        description: 'OnboardScreen_Description2'),
    OnboardModel(
        image: AppImages.onboardBanner2(),
        title: 'OnboardScreen_Title2',
        description: 'OnboardScreen_Description2'),
  ];
}
