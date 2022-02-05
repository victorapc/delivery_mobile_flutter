import 'package:delivery_mobile_flutter/app/core/constants/constants.dart';
import 'package:delivery_mobile_flutter/app/modules/order/finished/finished_page.dart';
import 'package:get/get.dart';

class OrdersRouters {
  OrdersRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: Constants.ROTA_ORDERS_FINISHED,
      page: () => const FinishedPage(),
    )
  ];
}