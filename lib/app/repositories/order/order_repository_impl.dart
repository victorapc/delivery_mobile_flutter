import 'dart:developer';

import 'package:delivery_mobile_flutter/app/core/constants/constants.dart';
import 'package:delivery_mobile_flutter/app/core/rest_client/rest_client.dart';
import 'package:delivery_mobile_flutter/app/models/order_pix.dart';
import 'package:delivery_mobile_flutter/app/repositories/order/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final RestClient _restClient;

  const OrderRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<OrderPix> createOrder(order) async {
    final result = await _restClient.post(Constants.ROTA_ORDER, {
      'userId': order.userId,
      'cpf': order.cpf,
      'address': order.address,
      'items': order.items
          .map((shoppingCard) => {
                'quantity': shoppingCard.quantity,
                'productId': shoppingCard.product.id,
              })
          .toList()
    });

    if (result.hasError) {
      log(
        'Erro ao realizar pedido ${result.statusCode}',
        error: result.statusText,
        stackTrace: StackTrace.current,
      );

      throw RestClientException('Erro ao realizar pedido.');
    }

    return OrderPix.fromMap(result.body);
  }
}
