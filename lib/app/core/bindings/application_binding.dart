import 'package:delivery_mobile_flutter/app/core/rest_client/rest_client.dart';
import 'package:delivery_mobile_flutter/app/core/services/shopping_card_service.dart';
import 'package:get/get.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => RestClient(),
      fenix: true,
    );
    Get.lazyPut(() => ShoppingCardService());
  }
}
