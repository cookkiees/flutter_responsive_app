import 'package:flutter/material.dart';
import 'package:flutter_resposive_app/app/modules/home/controller/home_controller.dart';

import 'package:get/get.dart';
import '../../utils/my_colors.dart';
import 'views/menu_category/category_1/category_1.dart';
import 'views/menu_category/category_2/category_2.dart';
import 'views/menu_category/category_3/category_3.dart';
import 'views/menu_category/category_4/category_4.dart';
import 'views/menu_category/category_5/category_5.dart';
import 'widgets/appbar_widget.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 100),
          child: AppbarWidget(),
        ),
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabCategoryIndex,
            children: const [
              CategoryOne(),
              CategoryTwo(),
              CategoryThree(),
              CategoryFour(),
              CategoryFive(),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          color: MyColors.orange,
          child: BottomNavigationBar(
            currentIndex: controller.tabCategoryIndex,
            selectedItemColor: Colors.blue,
            unselectedItemColor: const Color.fromRGBO(209, 209, 209, 1),
            onTap: controller.changePageCategory,
            backgroundColor: MyColors.orange,
            type: BottomNavigationBarType.shifting,
            selectedFontSize: 12,
            showUnselectedLabels: true,
            elevation: 0,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.remove),
                label: 'Categoty 1',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.remove),
                label: 'Category 2',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.remove),
                label: 'Category 3',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.remove),
                label: 'Category 4',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.remove),
                label: 'Category 5',
              ),
            ],
          ),
        ),
      );
    });
  }
}
