import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/my_colors.dart';
import '../../../controller/home_controller.dart';
import '../../../widgets/menu_tab_item_widget.dart';

class CategoryOne extends GetView<HomeController> {
  const CategoryOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: GetX<HomeController>(
            init: HomeController(),
            initState: (_) {},
            builder: (_) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
                  child: Center(
                    child: Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: [
                        MenuTabItemWidget(
                          title: "Coffee",
                          onPressed: () => controller.changePageProduct(0),
                          backgroundColor: controller.tabProductIndex.value == 0
                              ? MyColors.orange
                              : Colors.white,
                          textColor: controller.tabProductIndex.value == 0
                              ? Colors.white
                              : MyColors.dark,
                        ),
                        MenuTabItemWidget(
                          title: "Non Coffee",
                          onPressed: () => controller.changePageProduct(1),
                          backgroundColor: controller.tabProductIndex.value == 1
                              ? MyColors.orange
                              : Colors.white,
                          textColor: controller.tabProductIndex.value == 1
                              ? Colors.white
                              : MyColors.dark,
                        ),
                        MenuTabItemWidget(
                          title: "Food",
                          onPressed: () => controller.changePageProduct(2),
                          backgroundColor: controller.tabProductIndex.value == 2
                              ? MyColors.orange
                              : Colors.white,
                          textColor: controller.tabProductIndex.value == 2
                              ? Colors.white
                              : MyColors.dark,
                        ),
                        MenuTabItemWidget(
                          title: "Snack",
                          onPressed: () => controller.changePageProduct(3),
                          backgroundColor: controller.tabProductIndex.value == 3
                              ? MyColors.orange
                              : Colors.white,
                          textColor: controller.tabProductIndex.value == 3
                              ? Colors.white
                              : MyColors.dark,
                        ),
                        MenuTabItemWidget(
                          title: "Dessert",
                          onPressed: () => controller.changePageProduct(4),
                          backgroundColor: controller.tabProductIndex.value == 4
                              ? MyColors.orange
                              : Colors.white,
                          textColor: controller.tabProductIndex.value == 4
                              ? Colors.white
                              : MyColors.dark,
                        ),
                        controller.getPageProduct(),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
