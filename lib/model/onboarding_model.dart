class OnboardingContent {
  String image;
  String title;
  String description;
  OnboardingContent(
      {required this.image, required this.description, required this.title});
}

List<OnboardingContent> contents = [
  OnboardingContent(
      image: "assets/images/onboarding1.svg",
      description:
          "The ultimate app where we prioritise your convenience over anything else. Free up your time and do what matters most.",
      title: "Welcome to Butler app"),
  OnboardingContent(
      image: "assets/images/onboarding2.svg",
      description:
          "From housekeeping to property management and more. Each service is designed specifically to your every needs",
      title: "Find and book services"),
  OnboardingContent(
      image: "assets/images/onboarding3.svg",
      description:
          "Can’t find what you’re looking for? Speak to your personal concierge and leave the heavy lifting to us.",
      title: "Personal concierge assistant"),
  OnboardingContent(
      image: "assets/images/onboarding4.svg",
      description:
          "With just a few simple taps, we will accomplish any tasks for you. No task too big, no task too difficult",
      title: "Services at your fingertips")
];
