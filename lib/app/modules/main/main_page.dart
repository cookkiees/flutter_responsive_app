import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../cart_shopping/cart_shopping_page.dart';
import '../components/drawer.dart';
import '../home/home_page.dart';
import 'controller/main_controller.dart';

import 'responsive/responsive_layout.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKeyDrawer,
      body: ResponsiveLayout(
        tiny: Container(),
        phone: const HomePage(),
        tablet: Row(
          children: [
            Expanded(
              child: Center(
                child: Obx(() {
                  if (controller.selectedIndex.value == 0) {
                    return const HomePage();
                  } else if (controller.selectedIndex.value == 1) {
                    return const Text('Menu');
                  } else if (controller.selectedIndex.value == 2) {
                    return const Text('My Orders');
                  } else if (controller.selectedIndex.value == 3) {
                    return const Text('My Orders');
                  } else if (controller.selectedIndex.value == 4) {
                    return const Text("History");
                  } else if (controller.selectedIndex.value == 5) {
                    return const Text("Partners");
                  } else if (controller.selectedIndex.value == 6) {
                    return const Text("Settings");
                  } else {
                    return const Text("Donate to shelter");
                  }
                }),
              ),
            ),
          ],
        ),
        largeTablet: Row(
          children: [
            const SizedBox(width: 240, child: DrawerPage()),
            Expanded(
              flex: 2,
              child: Center(
                child: Obx(() {
                  if (controller.selectedIndex.value == 0) {
                    return const HomePage();
                  } else if (controller.selectedIndex.value == 1) {
                    return const Text('Menu');
                  } else if (controller.selectedIndex.value == 2) {
                    return const Text('My Orders');
                  } else if (controller.selectedIndex.value == 3) {
                    return const Text('My Orders');
                  } else if (controller.selectedIndex.value == 4) {
                    return const Text("History");
                  } else if (controller.selectedIndex.value == 5) {
                    return const Text("Partners");
                  } else if (controller.selectedIndex.value == 6) {
                    return const Text("Settings");
                  } else {
                    return const Text("Donate to shelter");
                  }
                }),
              ),
            ),
          ],
        ),
        desktop: Row(
          children: [
            const SizedBox(width: 240, child: DrawerPage()),
            VerticalDivider(
              thickness: 1,
              width: 1,
              color: Colors.grey.shade200,
            ),
            Expanded(
              flex: 9,
              child: Center(
                child: Obx(() {
                  if (controller.selectedIndex.value == 0) {
                    return const HomePage();
                  } else if (controller.selectedIndex.value == 1) {
                    return const Text('Menu');
                  } else if (controller.selectedIndex.value == 2) {
                    return const Text('My Orders');
                  } else if (controller.selectedIndex.value == 3) {
                    return const Text('My Orders');
                  } else if (controller.selectedIndex.value == 4) {
                    return const Text("History");
                  } else if (controller.selectedIndex.value == 5) {
                    return const Text("Partners");
                  } else if (controller.selectedIndex.value == 6) {
                    return const Text("Settings");
                  } else {
                    return const Text("Donate to shelter");
                  }
                }),
              ),
            ),
            Obx(() {
              if (controller.selectedIndex.value == 0) {
                return const SizedBox(width: 360, child: CartPage());
              } else {
                return Container();
              }
            }),
          ],
        ),
      ),
      drawer: const DrawerPage(),
      endDrawer: const CartPage(),
    );
  }
}
