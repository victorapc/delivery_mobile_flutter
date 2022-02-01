import 'package:delivery_mobile_flutter/app/core/ui/delivery_ui.dart';
import 'package:delivery_mobile_flutter/app/routes/auth_routers.dart';
import 'package:delivery_mobile_flutter/app/routes/splash_routers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const DeliveryMobileFlutterApp());
}

class DeliveryMobileFlutterApp extends StatelessWidget {
  const DeliveryMobileFlutterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Delivery App',
      theme: DeliveryUI.theme,
      getPages: [
        ...SplashRouters.routers,
        ...AuthRouters.routers,
      ],
    );
  }
}
