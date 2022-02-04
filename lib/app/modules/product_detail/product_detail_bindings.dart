import 'package:delivery_mobile_flutter/app/modules/product_detail/product_detail_controller.dart';
import 'package:get/get.dart';

class ProductDetailBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ProductDetailController(shoppingCardService: Get.find()));
  }
}