import 'package:delivery_mobile_flutter/app/modules/auth/register/register_controller.dart';
import 'package:delivery_mobile_flutter/app/repositories/auth/auth_repository.dart';
import 'package:delivery_mobile_flutter/app/repositories/auth/auth_repository_impl.dart';
import 'package:get/get.dart';

class RegisterBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(
        restClient: Get.find(),
      ),
    );

    Get.lazyPut(
      () => RegisterController(
        authRepository: Get.find(),
      ),
    );
  }
}
