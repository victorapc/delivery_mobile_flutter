import 'package:delivery_mobile_flutter/app/core/constants/constants.dart';
import 'package:delivery_mobile_flutter/app/modules/product_detail/product_detail_bindings.dart';
import 'package:delivery_mobile_flutter/app/modules/product_detail/product_detail_page.dart';
import 'package:get/get.dart';

class ProductRouters {
  ProductRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: Constants.ROTA_PRODUCT_DETAIL,
      binding: ProductDetailBindings(),
      page: () => const ProductDetailPage(),
    )
  ];
}
