import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/models.dart';

class MainController extends GetxController {
  var isLoading = false.obs;

  var selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  List<CoffeeItem> coffeeItems = [
    CoffeeItem(
      id: 1,
      name: 'Cappuccino',
      price: 3.99,
      image: 'assets/images/cappucino.jpg',
      description:
          'A shot of espresso with steamed milk and \na layer of frothed milk on top',
    ),
    CoffeeItem(
      id: 2,
      name: 'Latte',
      price: 4.49,
      image: 'assets/images/coffee-latte.jpg',
      description:
          'A shot of espresso with steamed milk and \na small layer of frothed milk on top',
    ),
    CoffeeItem(
      id: 3,
      name: 'V60',
      price: 4.99,
      image: 'assets/images/v60.jpg',
      description:
          'A shot of espresso with chocolate syrup, \nsteamed milk, and whipped cream',
    ),
    CoffeeItem(
      id: 2,
      name: 'Latte',
      price: 4.49,
      image: 'assets/images/coffee-latte.jpg',
      description:
          'A shot of espresso with steamed milk and \na small layer of frothed milk on top',
    ),
    CoffeeItem(
      id: 1,
      name: 'Cappuccino',
      price: 3.99,
      image: 'assets/images/cappucino.jpg',
      description:
          'A shot of espresso with steamed milk and \na layer of frothed milk on top',
    ),
    CoffeeItem(
      id: 2,
      name: 'Latte',
      price: 4.49,
      image: 'assets/images/coffee-latte.jpg',
      description:
          'A shot of espresso with steamed milk and \na small layer of frothed milk on top',
    ),
    CoffeeItem(
      id: 3,
      name: 'V60',
      price: 4.99,
      image: 'assets/images/v60.jpg',
      description:
          'A shot of espresso with chocolate syrup, \nsteamed milk, and whipped cream',
    ),
    CoffeeItem(
      id: 1,
      name: 'Cappuccino',
      price: 3.99,
      image: 'assets/images/cappucino.jpg',
      description:
          'A shot of espresso with steamed milk and \na layer of frothed milk on top',
    ),
  ];

  var cartItems = <CoffeeItem>[].obs;

  double get totalPrice {
    double total = 0.0;
    for (var item in cartItems) {
      total += item.price * item.quantity;
    }
    return total;
  }

  var totalCartPrice = 0.0.obs;
  double get totalPriceAll =>
      cartItems.fold(0, (sum, item) => sum + item.price * item.quantity);

  void addItemToCart(CoffeeItem item) {
    var index = cartItems.indexWhere((i) => i.id == item.id);
    if (index != -1) {
      cartItems[index].quantity += item.quantity;
    } else {
      cartItems.add(item);
    }
  }

  void removeItemFromCart(CoffeeItem item) {
    cartItems.removeWhere((i) => i.id == item.id);
  }

  void decrementQuantity(CoffeeItem item) {
    var index = cartItems.indexWhere((i) => i.quantity == item.quantity);
    isLoading(true);
    if (index != -1) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
      } else {
        cartItems.removeAt(index);
      }
    }
    isLoading(false);
  }

  void incrementQuantity(CoffeeItem item) {
    var index = cartItems.indexWhere((i) => i.quantity == item.quantity);
    isLoading(true);
    if (index != -1) {
      cartItems[index].quantity++;
    }
    isLoading(false);
  }

  final GlobalKey<ScaffoldState> scaffoldKeyDrawer = GlobalKey<ScaffoldState>();

  var isEndDrawerOpen = false.obs;

  void openEndDrawerPage() {
    scaffoldKeyDrawer.currentState?.openEndDrawer();
  }

  void openDrawerPage() {
    scaffoldKeyDrawer.currentState?.openDrawer();
  }

  List<String> titleDrawer = [
    "Home",
    "Setting",
    "Notifications",
    "Contacts",
    "Sales",
    "Marketing",
    "Security",
    "User"
  ];
  List<IconData> iconDrawer = [
    Icons.home,
    Icons.settings,
    Icons.notifications,
    Icons.contact_phone_rounded,
    Icons.sell,
    Icons.mark_email_read,
    Icons.verified_user,
    Icons.supervised_user_circle_rounded,
  ];

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

  List<String> title = [
    'Home Page',
    'Menu',
    'My Orders',
    'History',
    'History',
    'Partners',
    'Setting',
    'Donate to shelter',
  ];

  List<String> leading = [
    "assets/icons/home.svg",
    "assets/icons/view-grid.svg",
    "assets/icons/feedback.svg",
    "assets/icons/invoice.svg",
    "assets/icons/invoice.svg",
    "assets/icons/user.svg",
    "assets/icons/settings.svg",
    "assets/icons/heart.svg",
  ];
}
