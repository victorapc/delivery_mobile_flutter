import 'package:delivery_mobile_flutter/app/core/ui/widget/delivery_button.dart';
import 'package:delivery_mobile_flutter/app/modules/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF140E0E),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: context.width,
                child: Image.asset(
                  'assets/images/lanche.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(
                    height: context.heightTransformer(reducedBy: 85),
                  ),
                  Image.asset('assets/images/logo.png'),
                  const SizedBox(
                    height: 60,
                  ),
                  DeliveryButton(
                    label: 'ACESSAR',
                    width: context.widthTransformer(reducedBy: 40),
                    height: 35,
                    onPressed: () => controller.checkLogged(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
