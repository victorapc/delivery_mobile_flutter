import 'package:delivery_mobile_flutter/app/modules/auth/login/login_page.dart';
import 'package:delivery_mobile_flutter/app/modules/auth/register/register_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AuthRouters {
  AuthRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/auth/login',
      page: () => const LoginPage(),
    ),
    GetPage(
      name: '/auth/register',
      page: () => const RegisterPage(),
    )
  ];
}