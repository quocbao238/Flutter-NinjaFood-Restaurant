import 'package:ninjafood/app/core/core.dart';

class OnboardModel {
  final String image, title, description;

  OnboardModel({
    required this.image,
    required this.title,
    required this.description,
  });

  static final List<OnboardModel> datas = [
    OnboardModel(
        image: AppImageAssets.onboardBanner1,
        title: 'OnboardScreen_Title1',
        description: 'OnboardScreen_Description2'),
    OnboardModel(
        image: AppImageAssets.onboardBanner2,
        title: 'OnboardScreen_Title2',
        description: 'OnboardScreen_Description2'),
  ];
}
