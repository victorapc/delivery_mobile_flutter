import 'package:delivery_mobile_flutter/app/core/constants/constants.dart';
import 'package:delivery_mobile_flutter/app/core/ui/widget/delivery_appbar.dart';
import 'package:delivery_mobile_flutter/app/core/ui/widget/icon_badge.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_mobile_flutter/app/modules/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          onTap: (value) => controller.tabIndex = value,
          currentIndex: controller.tabIndex,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Lista',
            ),
            BottomNavigationBarItem(
              icon: IconBadge(
                number: controller.totalProductsInShoppingCard,
                icon: Icons.shopping_cart,
              ),
              label: 'Carrinho',
            ),
            const  BottomNavigationBarItem(
              icon: Icon(Icons.exit_to_app),
              label: 'Sair',
            )
          ],
        );
      }),
      body: Navigator(
        initialRoute: Constants.ROTA_MENU,
        key: Get.nestedKey(HomeController.NAVIGATOR_KEY),
        onGenerateRoute: controller.onGeneratedRouter,
      ),
    );
  }
}
