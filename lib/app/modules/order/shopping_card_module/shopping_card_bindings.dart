import 'package:delivery_mobile_flutter/app/modules/order/shopping_card_module/shopping_card_controller.dart';
import 'package:get/get.dart';

class ShoppingCardBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ShoppingCardController(
      authService: Get.find(),
      shoppingCardService: Get.find(),
    ));
  }
}
