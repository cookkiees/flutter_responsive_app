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

  int tinyHeightLimit = 100;
  int tinyLimit = 270;
  int phoneLimit = 550;
  int tabletLimit = 800;
  int largeTabletLimit = 1100;

  bool isTinyheightLimit(BuildContext context) =>
      MediaQuery.of(context).size.height.obs < tinyHeightLimit;

  bool isTinyLimit(BuildContext context) =>
      MediaQuery.of(context).size.width.obs < tinyLimit;

  bool isPhone(BuildContext context) =>
      MediaQuery.of(context).size.width.obs < phoneLimit &&
      MediaQuery.of(context).size.width.obs >= tinyLimit;

  bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width.obs < tabletLimit &&
      MediaQuery.of(context).size.width.obs >= phoneLimit;

  bool isLargeTablet(BuildContext context) =>
      MediaQuery.of(context).size.width.obs >= largeTabletLimit;

  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width.obs >= largeTabletLimit;
}
