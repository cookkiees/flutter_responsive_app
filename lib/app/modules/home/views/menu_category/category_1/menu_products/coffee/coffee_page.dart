import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../components/coffee_item_widget.dart';
import '../../../../../../main/controller/main_controller.dart';
import '../../../../../../models/models.dart';

class CoffeePage extends GetView<MainController> {
  const CoffeePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Wrap(
        spacing: 24,
        runSpacing: 24,
        children: List.generate(
          controller.coffeeItems.length,
          (index) => CoffeeItemWidget(
            item: CoffeeItem(
              id: controller.coffeeItems[index].id,
              name: controller.coffeeItems[index].name,
              price: controller.coffeeItems[index].price,
              description: controller.coffeeItems[index].description,
              image: controller.coffeeItems[index].image,
            ),
          ),
        ),
      ),
    );
  }
}
