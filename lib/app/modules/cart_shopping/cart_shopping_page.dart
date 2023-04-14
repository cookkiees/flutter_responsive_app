import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../utils/my_colors.dart';
import '../components/item_price_widget.dart';
import '../components/normal_button_widget.dart';
import '../main/controller/main_controller.dart';
import 'delivery/delivery_page.dart';

class CartPage extends GetView<MainController> {
  const CartPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 1,
      backgroundColor: Colors.white,
      child: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                child: Column(
                  children: [
                    ListTile(
                      dense: true,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 22, horizontal: 16),
                      minLeadingWidth: 50,
                      leading: const CircleAvatar(),
                      title: const Text(
                        "Albert Flores",
                        style: TextStyle(
                            fontSize: 16, overflow: TextOverflow.ellipsis),
                      ),
                      subtitle: const Text(
                        "albertflores@gmail.com",
                        style: TextStyle(overflow: TextOverflow.ellipsis),
                      ),
                      trailing: SvgPicture.asset(
                        "assets/icons/dots-vertical.svg",
                        height: 24,
                      ),
                    ),
                    const Divider(thickness: 1, height: 1),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Cart",
                            style: TextStyle(
                                fontSize: 24,
                                color: MyColors.dark,
                                overflow: TextOverflow.ellipsis),
                          ),
                          Text(
                            "Order #3243",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey.shade500,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      ),
                    ),
                    DefaultTabController(
                      length: 3,
                      child: Column(
                        children: <Widget>[
                          TabBar(
                            overlayColor:
                                MaterialStateProperty.resolveWith<Color?>(
                                    (Set<MaterialState> states) {
                              return states.contains(MaterialState.focused)
                                  ? null
                                  : Colors.transparent;
                            }),
                            splashFactory: NoSplash.splashFactory,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            physics: const NeverScrollableScrollPhysics(),
                            labelStyle: const TextStyle(fontSize: 14),
                            splashBorderRadius:
                                const BorderRadius.all(Radius.circular(32)),
                            unselectedLabelColor: MyColors.dark,
                            labelColor: MyColors.light,
                            dividerColor: MyColors.dark,
                            labelPadding:
                                const EdgeInsets.symmetric(horizontal: 8),
                            indicatorPadding: const EdgeInsets.only(
                                left: 8, bottom: 1, right: 8),
                            indicator: BoxDecoration(
                              shape: BoxShape.rectangle,
                              border: Border.all(color: Colors.grey.shade100),
                              color: MyColors.dark,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(24),
                              ),
                            ),
                            tabs: [
                              Container(
                                width: 150,
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(24),
                                    border: Border.all(
                                        color: Colors.grey.shade300)),
                                child: const Tab(
                                  text: "Delivery",
                                ),
                              ),
                              Container(
                                width: 100,
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(24),
                                    border: Border.all(
                                        color: Colors.grey.shade300)),
                                child: const Tab(
                                  text: "Dine In",
                                ),
                              ),
                              Container(
                                width: 100,
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(24),
                                    border: Border.all(
                                        color: Colors.grey.shade300)),
                                child: const Tab(
                                  text: "Take Away",
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0, left: 16),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height / 2.2,
                              child: TabBarView(
                                physics: const NeverScrollableScrollPhysics(),
                                children: [
                                  const DeliveryPage(),
                                  Container(
                                    color: Colors.white,
                                  ),
                                  Container(
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          Obx(() => controller.isLoading.value
                              ? const Visibility(
                                  visible: true,
                                  child: CircularProgressIndicator())
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: ItemsPriceWidget(
                                    title: 'Items',
                                    price:
                                        "\$ ${controller.totalPrice.toStringAsFixed(2)}",
                                  ),
                                )),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 18.0, horizontal: 16),
                            child: ItemsPriceWidget(
                                title: 'Discounts', price: "-\$ 3.00"),
                          ),
                          const Divider(),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 18.0, horizontal: 16),
                            child: ItemsPriceWidget(
                              title: 'Total',
                              price: "\$ ${controller.totalPrice.toString()}",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: NormalButtonWidget(
                              minimumSize: const Size(400, 50),
                              maximumSize: const Size(400, 50),
                              onPressed: () {},
                              child: const Text(
                                "Place on order",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
