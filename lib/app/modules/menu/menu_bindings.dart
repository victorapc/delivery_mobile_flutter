import 'package:delivery_mobile_flutter/app/modules/menu/menu_controller.dart';
import 'package:get/get.dart';

class MenuBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(MenuController());
  }
}