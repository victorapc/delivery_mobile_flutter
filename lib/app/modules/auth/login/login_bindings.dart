import 'package:delivery_mobile_flutter/app/modules/auth/login/login_controller.dart';
import 'package:delivery_mobile_flutter/app/repositories/auth/auth_repository.dart';
import 'package:delivery_mobile_flutter/app/repositories/auth/auth_repository_impl.dart';
import 'package:get/get.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(
        restClient: Get.find(),
      ),
    );

    Get.lazyPut(
      () => LoginController(
        authRepository: Get.find(),
      ),
    );
  }
}
