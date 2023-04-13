import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../main/controller/main_controller.dart';

class FoodPage extends GetView<MainController> {
  const FoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: const Center(
        child: Text('FoodPage'),
      ),
    );
  }
}
