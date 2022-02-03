import 'package:delivery_mobile_flutter/app/core/constants/constants.dart';
import 'package:delivery_mobile_flutter/app/modules/auth/login/login_bindings.dart';
import 'package:delivery_mobile_flutter/app/modules/auth/login/login_page.dart';
import 'package:delivery_mobile_flutter/app/modules/auth/register/register_bindings.dart';
import 'package:delivery_mobile_flutter/app/modules/auth/register/register_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AuthRouters {
  AuthRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: Constants.ROTA_LOGIN,
      binding: LoginBindings(),
      page: () => const LoginPage(),
    ),
    GetPage(
      name: Constants.ROTA_REGISTER,
      binding: RegisterBindings(),
      page: () => const RegisterPage(),
    )
  ];
}