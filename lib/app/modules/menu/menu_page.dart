import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'menu_controller.dart';

class MenuPage extends GetView<MenuController> {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('MENU'),
      ),
    );
  }
}
