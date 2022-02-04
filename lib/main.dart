import 'package:delivery_mobile_flutter/app/core/bindings/application_binding.dart';
import 'package:delivery_mobile_flutter/app/core/ui/delivery_ui.dart';
import 'package:delivery_mobile_flutter/app/routes/auth_routers.dart';
import 'package:delivery_mobile_flutter/app/routes/home_routers.dart';
import 'package:delivery_mobile_flutter/app/routes/product_routers.dart';
import 'package:delivery_mobile_flutter/app/routes/splash_routers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const DeliveryMobileFlutterApp());
}

class DeliveryMobileFlutterApp extends StatelessWidget {
  const DeliveryMobileFlutterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Delivery App',
      theme: DeliveryUI.theme,
      initialBinding: ApplicationBinding(),
      getPages: [
        ...SplashRouters.routers,
        ...AuthRouters.routers,
        ...HomeRouters.routers,
        ...ProductRouters.routers,
      ],
    );
  }
}
