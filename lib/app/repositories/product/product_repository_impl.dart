import 'dart:developer';

import 'package:delivery_mobile_flutter/app/core/constants/constants.dart';
import 'package:delivery_mobile_flutter/app/core/rest_client/rest_client.dart';
import 'package:delivery_mobile_flutter/app/models/product_model.dart';
import 'package:delivery_mobile_flutter/app/repositories/product/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final RestClient _restClient;

  ProductRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<List<ProductModel>> findAll() async {
    final result = await _restClient.get(Constants.ROTA_PRODUCTS);

    if (result.hasError) {
      log(
        'Erro ao buscar produtos ${result.statusCode}',
        error: result.statusText,
        stackTrace: StackTrace.current,
      );
      throw RestClientException('Erro ao buscar produtos.');
    }

    return result.body.map<ProductModel>((p) => ProductModel.fromMap(p)).toList();
  }
}
