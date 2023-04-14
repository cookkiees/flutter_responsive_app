import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/my_colors.dart';
import '../../components/button_item_widget.dart';
import '../../main/controller/main_controller.dart';
import '../../models/models.dart';

class DeliveryPage extends GetView<MainController> {
  const DeliveryPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Obx(
          () => SizedBox(
            height: MediaQuery.of(context).size.height / 2.5,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: controller.cartItems.length,
              itemBuilder: (context, index) {
                CoffeeItem item = controller.cartItems[index];

                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                      ),
                      height: 180,
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            height: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                item.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name,
                                style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 16,
                                    color: MyColors.dark),
                              ),
                              Text(
                                "Small • 200g",
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 12,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                              const SizedBox(
                                width: 32,
                              ),
                              Obx(
                                () => controller.isLoading.value
                                    ? const Visibility(
                                        visible: true,
                                        child: CircularProgressIndicator())
                                    : Text(
                                        "\$ ${item.price}",
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: MyColors.dark,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                              ),
                              Row(
                                children: [
                                  ButtonItemsWidget(
                                    onTap: () =>
                                        controller.decrementQuantity(item),
                                    icon: Icons.remove,
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Obx(
                                        () => controller.isLoading.value
                                            ? const Visibility(
                                                visible: false,
                                                child:
                                                    CircularProgressIndicator())
                                            : Text(
                                                "${(controller.cartItems[index].quantity)}",
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  color: MyColors.dark,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                      )),
                                  ButtonItemsWidget(
                                    onTap: () {
                                      controller.incrementQuantity(item);
                                    },
                                    icon: Icons.add,
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const Divider()
                  ],
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
