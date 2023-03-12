class OnboardModel {
  final String image, title, description;

  OnboardModel({
    required this.image,
    required this.title,
    required this.description,
  });

  static final List<OnboardModel> listData = [
    OnboardModel(
      image: 'assets/images/onboarding1.png',
      title: 'Find your Comfort \nFood here \n',
      description:
          '\nHere You Can find a chef or dish for every \ntaste and color. Enjoy!',
    ),
    OnboardModel(
      image: 'assets/images/onboarding2.png',
      title: 'Food Ninja is Where Your \nComfort Food Lives \n',
      description: '\nEnjoy a fast and smooth food delivery at \nyour doorstep',
    ),
  ];
}
