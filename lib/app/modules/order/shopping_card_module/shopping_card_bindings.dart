import 'package:delivery_mobile_flutter/app/modules/order/shopping_card_module/shopping_card_controller.dart';
import 'package:delivery_mobile_flutter/app/repositories/order/order_repository.dart';
import 'package:delivery_mobile_flutter/app/repositories/order/order_repository_impl.dart';
import 'package:get/get.dart';

class ShoppingCardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderRepository>(
        () => OrderRepositoryImpl(restClient: Get.find()));

    Get.put(ShoppingCardController(
      authService: Get.find(),
      shoppingCardService: Get.find(),
      orderRepository: Get.find(),
    ));
  }
}
