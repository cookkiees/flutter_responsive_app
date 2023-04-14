import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../utils/my_colors.dart';
import '../../components/normal_button_widget.dart';
import '../../main/controller/main_controller.dart';

class AppbarWidget extends GetView<MainController> {
  const AppbarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AppBar(
        elevation: 0,
        backgroundColor: MyColors.light,
        toolbarHeight: controller.isPhone(context) ? 60 : 100,
        leading: (controller.isTablet(context) || controller.isPhone(context))
            ? IconButton(
                onPressed: () {
                  controller.openDrawerPage();
                },
                icon: const Icon(
                  Icons.menu,
                  size: 24.0,
                  color: Colors.black,
                ),
              )
            : null,
        flexibleSpace: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: SizedBox(
              child: Stack(
                children: [
                  TextFormField(
                    style: const TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(24),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      hintText: "Search..",
                      hintStyle:
                          TextStyle(color: Colors.grey.shade400, fontSize: 18),
                      prefixIconConstraints: const BoxConstraints(minWidth: 60),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/search.svg",
                          colorFilter: ColorFilter.mode(
                            Colors.grey.shade400,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            32,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: NormalButtonWidget(
                      minimumSize: const Size(130, 70),
                      maximumSize: const Size(130, 70),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/levels.svg",
                            height: 20,
                            colorFilter: const ColorFilter.mode(
                                Colors.white, BlendMode.srcIn),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            "Filter",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        actions: [
          (controller.isLargeTablet(context))
              ? Visibility(child: Container())
              : Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                    onPressed: () {
                      controller.openEndDrawerPage();
                    },
                    icon: const Icon(Icons.shopping_cart, color: Colors.black),
                  ),
                )
        ],
      ),
    );
  }
}
