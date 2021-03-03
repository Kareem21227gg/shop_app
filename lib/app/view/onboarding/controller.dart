import 'model.dart';

class OnboardingController {
  List<ModelOnboarding> modelList = List<ModelOnboarding>();
  OnboardingController() {
    modelList.add(ModelOnboarding(
      imagePath: "lib/utillites/images/onboarding1.png",
      title: "View product 360 degrees",
      subTitle: "You can see the product with all angles, true and convenient",
    ));
    modelList.add(ModelOnboarding(
      imagePath: "lib/utillites/images/onboarding2.png",
      title: "Find products easily",
      subTitle:
          "You just need to take a photo or upload and we will find similar products for you.",
    ));
    modelList.add(ModelOnboarding(
      imagePath: "lib/utillites/images/onboarding3.png",
      title: "Payment is easy",
      subTitle:
          "You just need to take a photo or upload and we will find similar products for you.",
    ));
  }
}
