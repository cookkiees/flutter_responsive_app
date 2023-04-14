import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_resposive_app/app/modules/main/controller/main_controller.dart';
import 'package:get/get.dart';

import '../models/models.dart';
import 'normal_button_widget.dart';

class CoffeeItemWidget extends GetView<MainController> {
  final CoffeeItem item;

  const CoffeeItemWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    double widthDesktop;

    if (MediaQuery.of(context).size.width >= 1680) {
      widthDesktop = 243;
    } else if (MediaQuery.of(context).size.width >= 1300) {
      widthDesktop = 210;
    } else if (MediaQuery.of(context).size.width >= 1200) {
      widthDesktop = 185;
    } else {
      widthDesktop = 220;
    }

    double multiWidth;

    if (controller.isTablet(context)) {
      multiWidth = 243;
    } else if (controller.isPhone(context)) {
      multiWidth = 180;
    } else {
      multiWidth = 220;
    }

    return Obx(() => Container(
          padding: const EdgeInsets.all(16),
          height: 400,
          width: controller.isDesktop(context) ? widthDesktop : multiWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.asset(
                      item.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        '\$${item.price}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        item.description,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      NormalButtonWidget(
                        minimumSize: const Size(double.infinity, 50),
                        onPressed: () {
                          try {
                            controller.addItemToCart(item);
                            Get.snackbar("", "Add to cart");
                          } catch (error) {
                            if (kDebugMode) {
                              print(error);
                            }
                          }
                        },
                        child: const Text("Add to cart"),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
