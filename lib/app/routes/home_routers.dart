import 'package:delivery_mobile_flutter/app/core/constants/constants.dart';
import 'package:delivery_mobile_flutter/app/modules/home/home_bindings.dart';
import 'package:delivery_mobile_flutter/app/modules/home/home_page.dart';
import 'package:get/get.dart';

class HomeRouters {
  HomeRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: Constants.ROTA_HOME,
      binding: HomeBindings(),
      page: () => const HomePage(),
    )
  ];
}
