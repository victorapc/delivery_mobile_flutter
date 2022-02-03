import 'dart:developer';

import 'package:delivery_mobile_flutter/app/core/mixins/loader_mixin.dart';
import 'package:delivery_mobile_flutter/app/core/mixins/messages_mixin.dart';
import 'package:delivery_mobile_flutter/app/models/product_model.dart';
import 'package:delivery_mobile_flutter/app/repositories/product/product_repository.dart';
import 'package:get/get.dart';

class MenuController extends GetxController with LoaderMixin, MessagesMixin {
  final ProductRepository _productRepository;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();
  final menu = <ProductModel>[].obs;

  MenuController({required ProductRepository productRepository})
      : _productRepository = productRepository;

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
    messageListener(_message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();

    try {
      _loading.toggle();
      await findAllProduct();
      _loading.toggle();
    } catch (e, s) {
      _loading.toggle();

      log(
        'Erro ao buscar produto',
        error: e,
        stackTrace: s,
      );

      _message(
        MessageModel(
          title: 'Error',
          message: 'Erro ao buscar menu.',
          type: MessageType.error,
        ),
      );
    }
  }

  Future<void> findAllProduct() async {
    final products = await _productRepository.findAll();
    menu.assignAll(products);
  }

  Future<void> refreshPage() async {
    try {
      await findAllProduct();
    } catch (e, s) {

      log(
        'Erro ao buscar produto',
        error: e,
        stackTrace: s,
      );

      _message(
        MessageModel(
          title: 'Error',
          message: 'Erro ao buscar menu.',
          type: MessageType.error,
        ),
      );
    }
  }
}
