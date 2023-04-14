import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../utils/my_colors.dart';
import '../main/controller/main_controller.dart';

class DrawerPage extends GetView<MainController> {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 1,
      backgroundColor: Colors.white,
      child: SizedBox(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Purr\'',
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: MyColors.orange),
                        ),
                        TextSpan(
                          text: ' Coffee',
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: MyColors.dark),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 55,
                ),
                ...List.generate(
                  controller.titleDrawer.length,
                  (index) => Column(
                    children: [
                      if (index == 4)
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 32),
                          child: Divider(),
                        )
                      else
                        Obx(
                          () => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: ListTile(
                              dense: true,
                              contentPadding:
                                  const EdgeInsets.only(right: 0, left: 16),
                              leading: SvgPicture.asset(
                                controller.leading[index],
                                colorFilter:
                                    controller.selectedIndex.value == index
                                        ? const ColorFilter.mode(
                                            MyColors.orange, BlendMode.srcIn)
                                        : const ColorFilter.mode(
                                            MyColors.dark, BlendMode.srcIn),
                              ),
                              trailing: Container(
                                height: 80,
                                width: 3,
                                color: controller.selectedIndex.value == index
                                    ? MyColors.orange
                                    : Colors.white,
                              ),
                              title: Text(
                                controller.title[index],
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              selectedColor: MyColors.orange,
                              onTap: () =>
                                  controller.selectedIndex.value = index,
                              selected: controller.selectedIndex.value == index,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 300),
                ListTile(
                  contentPadding: const EdgeInsets.only(right: 0, left: 16),
                  leading: SvgPicture.asset("assets/icons/log-in.svg"),
                  title: const Text(
                    "Log out",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
