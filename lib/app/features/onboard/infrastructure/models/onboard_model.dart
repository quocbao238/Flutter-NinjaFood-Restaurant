class OnboardModel {
  final String image, title, description;

  OnboardModel({
    required this.image,
    required this.title,
    required this.description,
  });

  static final List<OnboardModel> datas = [
    OnboardModel(
        image: 'assets/images/onboarding1.png',
        title: 'OnboardScreen_Title1',
        description: 'OnboardScreen_Description2'),
    OnboardModel(
        image: 'assets/images/onboarding2.png',
        title: 'OnboardScreen_Title2',
        description: 'OnboardScreen_Description2'),
  ];
}
