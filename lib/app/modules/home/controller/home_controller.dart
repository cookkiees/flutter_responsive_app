import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/menu_category/category_1/menu_products/coffee/coffee_page.dart';
import '../views/menu_category/category_1/menu_products/dessert/dessert_page.dart';
import '../views/menu_category/category_1/menu_products/food/food_page.dart';
import '../views/menu_category/category_1/menu_products/non_coffee/non_coffee.dart';
import '../views/menu_category/category_1/menu_products/snack/snack_page.dart';

class HomeController extends GetxController {
  var tabCategoryIndex = 0;

  void changePageCategory(int index) {
    tabCategoryIndex = index;
    update();
  }

  var tabProductIndex = 0.obs;

  void changePageProduct(int index) {
    tabProductIndex.value = index;
  }

  Widget getPageProduct() {
    switch (tabProductIndex.value) {
      case 0:
        return const CoffeePage();
      case 1:
        return const NonCoffeePage();
      case 2:
        return const FoodPage();
      case 3:
        return const SncakPage();
      case 4:
        return const DessertPage();
      case 5:
        return Container();
      default:
        return Container();
    }
  }
}
