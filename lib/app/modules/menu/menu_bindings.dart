import 'package:delivery_mobile_flutter/app/modules/menu/menu_controller.dart';
import 'package:delivery_mobile_flutter/app/repositories/product/product_repository.dart';
import 'package:delivery_mobile_flutter/app/repositories/product/product_repository_impl.dart';
import 'package:get/get.dart';

class MenuBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductRepository>(
        () => ProductRepositoryImpl(restClient: Get.find()));
    Get.put(MenuController(productRepository: Get.find()));
  }
}
