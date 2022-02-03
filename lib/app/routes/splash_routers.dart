import 'package:delivery_mobile_flutter/app/modules/splash/splash_bindigs.dart';
import 'package:delivery_mobile_flutter/app/modules/splash/splash_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class SplashRouters {
  SplashRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/',
      binding: SplashBindings(),
      page: () => const SplashPage(),
    )
  ];
}
