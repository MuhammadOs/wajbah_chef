class OnBoardingData {
  String image;
  String firstText;
  String secondText;
  String description;

  OnBoardingData(
      {required this.image,
      required this.firstText,
      required this.secondText,
      required this.description});
}

List<OnBoardingData> content = [
  OnBoardingData(
      image: 'assets/images/onboarding/Onboarding_1.png',
      firstText: 'Complete',
      secondText: 'Dashboard',
      description:
          'You can easily access your business indicators and obtain all the data related to the sales movement'),
  OnBoardingData(
      image: 'assets/images/onboarding/Onboarding_2.png',
      firstText: 'Build Your',
      secondText: 'Profile',
      description:
          'Create your own account for your kitchen and add your own menu and other things'),
  OnBoardingData(
      image: 'assets/images/onboarding/Onboarding_3.png',
      firstText: 'Increase Your',
      secondText: 'Income',
      description:
          'Delivering your order quickly to your doorstep, ensuring you satisfy your cravings in no time.'),
  OnBoardingData(
      image: 'assets/images/onboarding/Onboarding_4.png',
      firstText: 'Wajbah Team',
      secondText: 'Will Help!',
      description:
          'make marketing campaigns, photo sessions, and other services that we provide'),
];
