import 'package:get/get.dart';

import 'onboarding_controller.dart';

class OnboardingBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(OnboardingController());
  }
}
