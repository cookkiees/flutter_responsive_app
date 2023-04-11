
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/size_config.dart';
import 'onboarding_controller.dart';

class OnboardingScreen extends GetView<OnboardingController> {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container();
  }
}
