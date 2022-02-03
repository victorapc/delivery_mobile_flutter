import 'package:delivery_mobile_flutter/app/core/constants/constants.dart';
import 'package:delivery_mobile_flutter/app/core/services/auth_service.dart';
import 'package:delivery_mobile_flutter/app/modules/menu/menu_bindings.dart';
import 'package:delivery_mobile_flutter/app/modules/menu/menu_page.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeController extends GetxController {
  static const NAVIGATOR_KEY = 1;

  final _tabIndex = 0.obs;
  final _tabs = [Constants.ROTA_MENU, Constants.ROTA_SHOPPING_CARD, Constants.ROTA_EXIT];

  int get tabIndex => _tabIndex.value;

  set tabIndex(int index) {
    _tabIndex(index);
    if (_tabs[index] == Constants.ROTA_EXIT) {
      Get.find<AuthService>().logout();
    } else {
      Get.toNamed(_tabs[index], id: NAVIGATOR_KEY);
    }
  }

  Route? onGeneratedRouter(RouteSettings settings) {
    if (settings.name == Constants.ROTA_MENU) {
      return GetPageRoute(
        settings: settings,
        page: () => const MenuPage(),
        binding: MenuBindings(),
        transition: Transition.fadeIn,
      );
    }

    if (settings.name == Constants.ROTA_SHOPPING_CARD) {}
  }
}
