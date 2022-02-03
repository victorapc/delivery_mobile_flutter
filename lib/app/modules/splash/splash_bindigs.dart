import 'package:delivery_mobile_flutter/app/modules/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}