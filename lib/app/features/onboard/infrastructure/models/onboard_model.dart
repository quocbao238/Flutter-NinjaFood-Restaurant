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
      title: 'Find your Comfort Food here',
      description:
          'Here You Can find a chef or dish for every taste and color. Enjoy!',
    ),
    OnboardModel(
      image: 'assets/images/onboarding2.png',
      title: 'Food Ninja is Where Your Comfort Food Lives',
      description: 'Enjoy a fast and smooth food delivery at your doorstep',
    ),
  ];
}
