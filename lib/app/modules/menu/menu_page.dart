import 'package:delivery_mobile_flutter/app/modules/menu/widget/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'menu_controller.dart';

class MenuPage extends GetView<MenuController> {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RefreshIndicator(
        onRefresh: controller.refreshPage,
        child: ListView.builder(
          itemCount: controller.menu.length,
          itemBuilder: (context, index) {
            final prod = controller.menu[index];
            return ProductTile(product: prod);
          },
        ),
      );
    });
  }
}
